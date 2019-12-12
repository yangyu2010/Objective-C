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

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *p1 = [[Person alloc] init];
        p1.age = 10;
        p1.name = @"jack";
        
        Person *p2 = [[Person alloc] init];
        p2.age = 20;
        p2.name = @"rose";

        NSLog(@"Person1 %d %@", p1.age, p1.name);
        NSLog(@"Person2 %d %@", p2.age, p2.name);
        

    }
    return 0;
}
