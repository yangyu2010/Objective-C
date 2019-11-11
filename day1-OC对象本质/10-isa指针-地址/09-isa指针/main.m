//
//  main.m
//  09-isa指针
//
//  Created by YangYu on 2019/11/7.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


// MJPerson
@interface Person : NSObject <NSCopying>
{
@public
    int _age;
}
@property (nonatomic, assign) int no;
- (void)personInstanceMethod;
+ (void)personClassMethod;
@end

@implementation Person

- (void)test
{
    
}

- (void)personInstanceMethod
{
    
}
+ (void)personClassMethod
{
    
}
- (id)copyWithZone:(NSZone *)zone
{
    return nil;
}
@end

// MJStudent
@interface Student : Person <NSCoding>
{
@public
    int _weight;
}
@property (nonatomic, assign) int height;
- (void)studentInstanceMethod;
+ (void)studentClassMethod;
@end

@implementation Student
- (void)test
{
    
}
- (void)studentInstanceMethod
{
    
}
+ (void)studentClassMethod
{
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

@end

struct objc_class_2 {
    Class isa;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        Class personClass = [Person class];
        Class personMetaClass = object_getClass(personClass);
        
        NSLog(@"%p", p);                // 0x100606660
        NSLog(@"%p", personClass);      // 0x1000014c8
        NSLog(@"%p", personMetaClass);  // 0x1000014a0
        
        // __x86_64__  define ISA_MASK        0x00007ffffffffff8ULL
        // __arm64__   define ISA_MASK        0x0000000ffffffff8ULL
        
        // p/x (long)p->isa                             0x001d8001000014c9
        // p/x personClass                              0x00000001000014c8
        // p/x personMetaClass                          0x00000001000014a0
        
        // p/x 0x001d8001000014c9 & 0x00007ffffffffff8  0x00000001000014c8
        // p/x 0x00000001000014c8 & 0x00007ffffffffff8  0x00000001000014c8
        
        
        
        // p personClass->isa       error: member reference base type 'Class' is not a structure or union
        struct objc_class_2 *personClass2 = (__bridge struct objc_class_2 *)(personClass);
        NSLog(@"%p", personClass2->isa);
        
    }
    return 0;
}




