//
//  main.m
//  Interview001-OC对象的本质
//
//  Created by YangYu on 2019/11/5.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

/**
 xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main.cpp
 sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
 https://juejin.im/post/5abdd56df265da2396127e6b
 
@interface NSObject <NSObject> {
    Class isa ;
}
 
/// An opaque type that represents an Objective-C class.
typedef struct objc_class *Class;

 
struct NSObject_IMPL {
    Class isa;
};
 
 */


/**
struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
};
*/

@interface Person : NSObject
{
@public
    int _age;
    int _number;
    int _name;
}
@end
@implementation  Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // MARK:- NSObject
        
        NSObject *obj = [[NSObject alloc] init];
        
        // 8
        // Class's ivar size rounded up to a pointer-size boundary.
        // 类的成员变量size
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        // 16
        NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
        
        /**
         一个NSObject对象占多少内存呢？
         
         系统是分配了16字节给NSObject对象，真正使用的空间其实是一个指针的大小
         */
        
        
        // MARK:- 自定义对象
        Person *p = [[Person alloc] init];

        
        // 16(只有_no和_age)  24(加了_name)
        NSLog(@"%zd", class_getInstanceSize([Person class]));
        // 16(只有_no和_age)  32(加了_name)
        NSLog(@"%zd", malloc_size((__bridge const void *)(p)));
        
        // 加了_name
        // 属性占24字节 4(_no) + 4(_age) + 4(_name) + 8(isa指针) = 20
        // 空间不够时 每次添加8字节
        // 空对象时, 和NSObject完全一样, 开辟了8个字节
        // 加一个 int _age 变成了16字节, 这时实际使用了12字节, 所以你再添加一个 int 时, 还会是16, 依此类推
        
        // 但是这个实例开辟了32字节 实际使用了24字节
        // 问题是: 为什么不开辟24字节了?
        // 空间不够时 每次添加16字节 就是16的倍数
        // 加了 _name 应该占用是20字节, 16字节不够, 扩充时, 扩容到32字节
    }
    return 0;
}
