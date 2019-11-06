//
//  main.m
//  02-自定义对象的本质
//
//  Created by YangYu on 2019/11/5.
//  Copyright © 2019 YangYu. All rights reserved.
//

// xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp



#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

struct NSObject_IMPL {
    Class isa;
};
struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
};
struct Student_IMPL {
    struct Person_IMPL Person_IVARS;
    int _no;
};



// Person
@interface Person : NSObject
{
    int _age;
//    NSString *_name;
    
}
@end

@implementation Person
@end

// Student
@interface Student : Person
{
    int _no;
    int _no1;
}
@end

@implementation Student
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        NSLog(@"Person - %zd", class_getInstanceSize([Person class]));
        NSLog(@"Person - %zd", malloc_size((__bridge const void *)(p)));
        
        Student *s = [[Student alloc] init];
        NSLog(@"Student - %zd", class_getInstanceSize([Student class]));
        NSLog(@"Student - %zd", malloc_size((__bridge const void *)(s)));
        
        /**
        2019-11-05 18:47:39.561102+0800 02-自定义对象的本质[12989:1328358] Person - 16
        2019-11-05 18:47:39.561278+0800 02-自定义对象的本质[12989:1328358] Person - 16
        2019-11-05 18:47:39.561293+0800 02-自定义对象的本质[12989:1328358] Student - 24
        2019-11-05 18:47:39.561300+0800 02-自定义对象的本质[12989:1328358] Student - 32
         */
        
        /**
         继承:
         先看父类实际占多少字节, 不是对齐后的, 需要看没有对齐的
         然后再加上自己的
         */
    }
    return 0;
}
