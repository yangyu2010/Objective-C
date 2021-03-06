# iOS一个对象占用多少空间?

[GitHub 地址](https://github.com/yangyu2010/Objective-C/tree/master/Interview001-OC对象的本质)


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

size_t instanceSize(size_t extraBytes) {
    size_t size = alignedInstanceSize() + extraBytes;
    // CF requires all objects be at least 16 bytes.
    if (size < 16) size = 16;
    return size;
}
```
6. 那为什么会分配16个字节了? 也是在 runtime 里找到了答案, 当 size < 16 时, 会默认分配16个字节

可以参照 [这篇文章](https://juejin.im/post/5abdd56df265da2396127e6b) 把.m文件编译成.cpp文件, 查看 NSObject真正的实现, 可以理解是对应 c++ 里的结构体

我的 [GitHub](https://github.com/yangyu2010/Objective-C/tree/master/Interview001-OC对象的本质) 里有已经编译后的.cpp文件 大家可以查看


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

5. 这时自定义对象包含了
    
    - 1个结构体指针 (8字节)
    - 1个 int _age (4字节)
    - 1个 int _number (4字节)

   8 + 4 + 4 = 16 字节

- 没有添加任何成员变量时, 只有1个结构体指针, 所以会是8字节
- 添加1个成员变量时, 有1个结构体指针, 和1个 int 类型的值, 那就是 8 + 4 = 12, 为什么 class_getInstanceSize 得到的结果是16了. 其实扩容基数是8(内存对齐原因, 结构体的大小必须是最大成员大小的倍数), 8个字节不够了, 就开辟了8*2个字节, 依此类推
- 添加了2个成员变量时, 有1个结构体指针, 和2个 int 类型的值,那就是 8 + 4 + 4 = 16

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
但是 malloc_size 却是 32了, 因为是以16为基数来扩容的, 因为 iOS 在分配对象内存时, 都是以16倍数来分配的

## 3.结论
 - 1个 NSObject 对象占用了16个字节
 - 1个自定义对象占用了几个字节, 需要有多少成员变量, 同时还要计算上 NSObject 的 isa 指针大小, 同时为了对齐, 必须是16的倍数

## 4.注意点
    - 如果自定义类有继承关系, 如 Student 继承于 Person, 要继续父类的成员变量
    - 注意内存对齐问题, iOS 分配内存问题


参考:
https://www.jianshu.com/p/c22279cba38d
https://juejin.im/post/5abdd56df265da2396127e6b
https://www.iteye.com/blog/jakend-1839987
https://github.com/ludx/The-Lost-Art-of-C-Structure-Packing