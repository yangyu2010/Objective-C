//
//  Person.m
//  Category
//
//  Created by YangYu on 2019/11/28.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)load
{
    [super load];
    NSLog(@"Person load");
}


- (void)test {
    NSLog(@"Person test");
}

+ (void)classAction {
    NSLog(@"Person classAction");
}

@end
