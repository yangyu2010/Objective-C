//
//  main.m
//  09-isa指针
//
//  Created by YangYu on 2019/11/7.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "MJClassInfo.h"

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
        
//        Person *p = [[Person alloc] init];
//        Class personClass = [Person class];
//        Class personMetaClass = object_getClass(personClass);
//
//        NSLog(@"%p", p);                // 0x100606660
//        NSLog(@"%p", personClass);      // 0x1000014c8
//        NSLog(@"%p", personMetaClass);  // 0x1000014a0
        
        struct mj_objc_class *personClass = (__bridge struct mj_objc_class *)[Person class];
        struct mj_objc_class *studentClass = (__bridge struct mj_objc_class *)[Student class];

        class_rw_t *personClassData = personClass->data();
        class_rw_t *studentClassData = studentClass->data();


        mj_objc_class *metaClass = studentClass->metaClass();
        class_rw_t *metaClassData = metaClass->data();

        
        printf("1111");
    }
    return 0;
}




