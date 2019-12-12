//
//  main.m
//  Category
//
//  Created by YangYu on 2019/11/28.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *p = [[Person alloc] init];
        [p test];
        [Person testClass];
        
    }
    return 0;
}
