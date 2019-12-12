//
//  Person+Test.m
//  Category
//
//  Created by YangYu on 2019/11/28.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person+Test.h"

@implementation Person (Test)

+ (void)load
{
    NSLog(@"Person (Test) load");
}

- (void)test {
    NSLog(@"Person (Test) test");
}

+ (void)classAction {
    NSLog(@"Person (Test) classAction");
}

@end
