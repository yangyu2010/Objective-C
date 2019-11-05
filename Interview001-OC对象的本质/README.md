# iOS一个对象占用多少空间?

GitHub 地址:<br>
https://github.com/yangyu2010/Objective-C/tree/master/Interview001-OC对象的本质


## 1.获取 NSObject 对象占用的空间

1. 创建一个 NSObject 对象, 分别调用 class_getInstanceSize 和 malloc_size 方法

```
NSObject *obj = [[NSObject alloc] init];

// 需要导入 #import <objc/runtime.h>
NSLog(@"%zd", class_getInstanceSize([NSObject class]));

// 需要导入 #import <malloc/malloc.h>
NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
```
2. 得到输出:

```
2019-11-05 15:10:22.210505+0800 Interview001-OC对象的本质[9215:816956] 8
2019-11-05 15:10:22.210675+0800 Interview001-OC对象的本质[9215:816956] 16
```

3. 可以看出系统开辟了16个字节, 但是该对象只是用了8个字节
    这是为什么了?

4. 点进 NSObject 可以看到下面的代码, NSObject 对象真正的是一个结构体指针, 所以会占用8个字节
```
/// An opaque type that represents an Objective-C class.
typedef struct objc_class *Class;

@interface NSObject <NSObject> {
    Class isa ;
}
```

5. 在 https://opensource.apple.com/tarballs/ 找到 runtime 源码, 搜索 class_getInstanceSize 可以找到下面的代码, 可以看出 class_getInstanceSize 获取的是类的成员变量的 size, 并不是一个对象所占用的空间

```
size_t class_getInstanceSize(Class cls)
{
    if (!cls) return 0;
    return cls->alignedInstanceSize();
}

// Class's ivar size rounded up to a pointer-size boundary.
    uint32_t alignedInstanceSize() {
        return word_align(unalignedInstanceSize());
    }
```
可以参照 https://juejin.im/post/5abdd56df265da2396127e6b 把.m文件编译成.cpp文件, 查看 NSObject真正的实现, 可以理解是对应 c++ 里的结构体

我的 GitHub 里有已经编译后的.cpp文件 大家可以查看


## 2. 自定义对象占用的空间

自定义一个 Person类
```
@interface Person : NSObject
{
}
@end

@implementation  Person
@end
```

1. 打印当前对象
```
Person *p = [[Person alloc] init];

NSLog(@"%zd", class_getInstanceSize([Person class]));
NSLog(@"%zd", malloc_size((__bridge const void *)(p)));
```
得到的结果和 NSObject 对象一样的
```
2019-11-05 15:30:11.991698+0800 Interview001-OC对象的本质[9360:864510] 8
2019-11-05 15:30:11.991704+0800 Interview001-OC对象的本质[9360:864510] 16
```

2. 给自定义对象添加1个成员变量, 再次打印

```
@interface Person : NSObject
{
    int _age;
}
@end
```

```
2019-11-05 15:31:56.767972+0800 Interview001-OC对象的本质[9385:868476] 16
2019-11-05 15:31:56.767978+0800 Interview001-OC对象的本质[9385:868476] 16
```

3. 再次添加成员变量, 再次打印
```
@interface Person : NSObject
{
    int _age;
    int _number;
}
@end
```
```
2019-11-05 15:34:16.503491+0800 Interview001-OC对象的本质[9414:874058] 16
2019-11-05 15:34:16.503497+0800 Interview001-OC对象的本质[9414:874058] 16
```

4. 很奇怪, 没有变化啊? 我们编程成.cpp再来分析
```
struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
    int _number;
};
```

5. 自定义对象包含了
    
    - 1个结构体指针 (8字节)
    - 1个 int _age (4字节)
    - 1个 int _number (4字节)

   8 + 4 + 4 = 16 字节

   没有添加任何成员变量时, 只有1个结构体指针, 所以会是8字节
   所以 class_getInstanceSize 会是8, class_getInstanceSize 是16, 就是说开辟了16个字节, 但是该实例对象只使用了8字节

   添加1个成员变量时, 有1个结构体指针, 和1个 int 类型的值, 那就是 8 + 4 = 12啊, 为什么 class_getInstanceSize 得到的结果是16了. 其实扩容基数是8, 8个字节不够了, 就开辟了8*2个字节, 依此类推

6. 再添加一个成员变量
```
@interface Person : NSObject
{
    int _age;
    int _number;
    int _sex;
}
@end
```
```
2019-11-05 15:48:24.959113+0800 Interview001-OC对象的本质[9511:896453] 24
2019-11-05 15:48:24.959120+0800 Interview001-OC对象的本质[9511:896453] 32
```
可以看出 class_getInstanceSize 已经是8*3=24字节了
但是 malloc_size 却是 32了, 因为是以16为基数来扩容的