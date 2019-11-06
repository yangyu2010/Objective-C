# iOS 内存对齐问题

## 1.问题
有两个同样的 Person 类, 看一下分别在内存中占用多少空间?(64位系统, 本文按照64位系统)
```
@interface Person : NSObject
{
    char _sex;
    int _age;
    char _sex2;
}
@end

@implementation Person
@end
```

```
@interface Person : NSObject
{
    int _age;
    char _sex;
    char _sex2;
}
@end

@implementation Person
@end
```

分别调用下面的代码
```
NSLog(@"Person - %zd", class_getInstanceSize([Person class]));
NSLog(@"Person - %zd", malloc_size((__bridge const void *)(p)));
```

## 2.结果

```
第一种情况:

2019-11-05 20:17:59.141275+0800 02-自定义对象的本质[14104:1492184] Person - 24
2019-11-05 20:17:59.141465+0800 02-自定义对象的本质[14104:1492184] Person - 32
```

```
第一种情况:

2019-11-05 20:20:08.278670+0800 02-自定义对象的本质[14139:1500726] Person - 16
2019-11-05 20:20:08.278916+0800 02-自定义对象的本质[14139:1500726] Person - 16
```

## 3.分析

### 3.1 基本数据类型占用的字节数    
```
char a;     // 1
short b;    // 2
int c;      // 4
long d;     // 8
float e;    // 4
double g;   // 8
int *h;     // 8
```

### 3.2 先分析第2种情况

```
Class isa;     /* 8 bytes */
int   age;     /* 4 byte */
char  sex;     /* 1 bytes */
char  sex2;    /* 1 bytes */
```

![](https://upload-images.jianshu.io/upload_images/1792156-a5d485ab56fcc962.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

可以看出, Person 对象中还有2个字节是空余的, 可以再加入1个 short 试试, 内存占用同样是16, 16, 这是已经占满了
如果再加1个 char (前提是已经加了1个 short了), 那就要扩容了, 得到的是24, 32

### 3.3 再分析第1种情况

```
Class isa;     /* 8 bytes */
char  sex;     /* 1 bytes */
char  pad[3];  /* 3 bytes */
int   age;     /* 4 byte */
char  sex2;    /* 1 bytes */
```

字符数组pad[3]意味着在这个结构体中，有3个字节的空间被浪费掉了。老派术语将其称之为“废液（slop）”。

内存对齐的解释: [来源](http://www.catb.org/esr/structure-packing/#_related_reading)
```
首先需要了解的是，对于现代处理器，C编译器在内存中放置基本C数据类型的方式受到约束，以令内存的访问速度更快。

在x86或ARM处理器中，基本C数据类型通常并不存储于内存中的随机字节地址。实际情况是，除char外，所有其他类型都有“对齐要求”：char可起始于任意字节地址，2字节的short必须从偶数字节地址开始，4字节的int或float必须从能被4整除的地址开始，8比特的long和double必须从能被8整除的地址开始。无论signed（有符号）还是unsigned（无符号）都不受影响。
```

![](https://upload-images.jianshu.io/upload_images/1792156-32333fdafe18dbf4.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如果把 sex2 删除, 那应该就得到16, 16了

### 3.4 查看内存来观察
第一种情况给成员变量添加一个 @public 以便赋值
实例化一个 Person 对象, 给 age, sex 分别赋值

```
Person *p = [[Person alloc] init];
p->_sex = 'c';
p->_age = 12;
p->_sex2 = 'b';

NSLog(@"Person - %zd", class_getInstanceSize([Person class]));
NSLog(@"Person - %zd", malloc_size((__bridge const void *)(p)));
```
1. 先打印当前实例对象的内存地址 
    ```
    po p
    ```

2. 然后读取内存
    ```
    memory read 内存地址
    ```

3. 结果如下图
![](https://upload-images.jianshu.io/upload_images/1792156-a6d96d60f15b9d4e.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4. 分析
    - 前面8位, 存的是 isa 指针
    - 第9位存的是 sex, 十六进制的63对应十进制的99, 也就是‘c’的 ASCII码
    - 从第10位到第12位, 总共3个字节, 是空的(00)
    - 从13位到16位, 存的是 age, 12的十六进制对应的是c
    - 下一位62对应的是 sex2, 'b'的 ASCII码是98, 再转成十六进制就是62


## 4.该问题在 Swift 下会是什么样的?

### 4.1 Class 类对象
```
class Person: NSObject {
    let gender: Bool
    var age: Int = 0
    
    init(gender: Bool, age: Int) {
        self.gender = gender
        self.age = age
    }
}
```

```
var p = Person(gender: true, age: 11)

let size = MemoryLayout<Person>.size
print(size)

let instanceSize = MemoryLayout<Person>.size(ofValue: p)
print(instanceSize)
```
得到的结果都是8, 不管属性数量的多少

![](https://upload-images.jianshu.io/upload_images/1792156-dd6be4312dffe8c8.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 先打印当前 Class 实例对象的内存的地址
- 当前实例对象在 Stack 区, 同时保存的内容是 指向 Heap 区
- 根据打印出的内存地址, 再次打印 Heap 区(注意大小端, 从高位读取)
- 大概看到了存储的值01, 0b(11)

![[图片上传中...(Xnip2019-11-06_15-25-10.jpg-4ecdc7-1573025198899-0)]
](https://upload-images.jianshu.io/upload_images/1792156-9d4aaf4f48eadfa1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 4.1 Struct 结构体对象
```
同样的代码, 只是换成了 struct

struct Person {
    let gender: Bool
    var age: Int = 0
    
    init(gender: Bool, age: Int) {
        self.gender = gender
        self.age = age
    }
}
```
打印得出的是16
分析:

- Bool 类型占1个字节, 对齐长度也是1个字节
- Int 类型占8个字节, 对齐长度是8个字节
- 那说明 gender 后面有7个字节是浪费的, 因为 Int 对齐长度是8
- 如果反着来, 把 age 放上面, 打印的是 9


![](https://upload-images.jianshu.io/upload_images/1792156-490d9633525bf1c3.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](https://upload-images.jianshu.io/upload_images/1792156-9635b724a01da08b.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

参考文档:
http://www.catb.org/esr/structure-packing/#_related_reading