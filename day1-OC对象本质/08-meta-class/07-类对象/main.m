//
//  main.m
//  07-类对象
//
//  Created by YangYu on 2019/11/7.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject
{
    int _age;
    int _height;
}
@end

@implementation Person
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSObject *obj1 = [[NSObject alloc] init];
        NSObject *obj2 = [[NSObject alloc] init];

        Class objectClass1 = [obj1 class];
        Class objectClass2 = [obj2 class];
        Class objectClass3 = object_getClass(obj1);
        Class objectClass4 = object_getClass(obj2);
        Class objectClass5 = [NSObject class];

        NSLog(@"%p", objectClass1);
        NSLog(@"%p", objectClass2);
        NSLog(@"%p", objectClass3);
        NSLog(@"%p", objectClass4);
        NSLog(@"%p", objectClass5);
        
        NSLog(@"------person class--------");
        Person *p = [[Person alloc] init];
        NSLog(@"%p", p.class);
        NSLog(@"%p", object_getClass(p));
        
        NSLog(@"------person meta-class--------");
        NSLog(@"%p", object_getClass(p.class));
        
        NSLog(@"--------------");

        NSLog(@"%p", object_getClass([NSObject class]));
        NSLog(@"%p", object_getClass(objectClass5));
        
        
//        NSLog(@"%p", object_getClass([NSObject class]));
//        NSLog(@"%p", object_getClass(objectClass5));
        
        // 注意点 class方法一直返回的是类对象, 不是元类对象
        // [[NSObject class] className]
    }
    return 0;
}
