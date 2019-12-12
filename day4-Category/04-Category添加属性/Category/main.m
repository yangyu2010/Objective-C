//
//  main.m
//  Category
//
//  Created by YangYu on 2019/11/28.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <objc/runtime.h>
#import "Person+Test.h"

void printMethodNamesOfClass(Class cls)
{
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ %@", cls, methodNames);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        [Person alloc];
        Person *p1 = [[Person alloc] init];
        p1.age = 10;
        p1.weight = 10;
        
        Person *p2 = [[Person alloc] init];
        p2.age = 20;
        p2.weight = 20;
        
        NSLog(@"Person1 %d %d", p1.age, p1.weight);
        NSLog(@"Person2 %d %d", p2.age, p2.weight);
        

    }
    return 0;
}
