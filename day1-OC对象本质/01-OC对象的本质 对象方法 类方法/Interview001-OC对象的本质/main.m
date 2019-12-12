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
- (void)eat {
}
+ (void)run {
    
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        // MARK:- 自定义对象
        Person *p = [[Person alloc] init];
        [p eat];
        
        [Person run];
        
        
//        ((void (*)(id, SEL))(void *)objc_msgSend)((id)p, sel_registerName("eat"));
//
//        ((void (*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Person"), sel_registerName("run"));
        
        
    }
    return 0;
}
