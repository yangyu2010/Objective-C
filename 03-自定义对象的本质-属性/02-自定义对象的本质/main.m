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
    NSString *_name;
};



// Person
@interface Person : NSObject
{
    int _age;
    char _sex;
    char _sex2;
    short _sex3;
    char _sex4;

}
//@property(nonatomic, copy) NSString *name;

@end

@implementation Person
@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        NSLog(@"Person - %zd", class_getInstanceSize([Person class]));
        NSLog(@"Person - %zd", malloc_size((__bridge const void *)(p)));
        
        
    }
    return 0;
}
