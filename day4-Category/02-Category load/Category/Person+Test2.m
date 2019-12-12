//
//  Person+Test2.m
//  Category
//
//  Created by YangYu on 2019/11/29.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person+Test2.h"

@implementation Person (Test2)

+ (void)load
{
    NSLog(@"Person (Test2) load");
}

- (void)test {
    NSLog(@"Person (Test2) test");
}

+ (void)classAction {
    NSLog(@"Person (Test2) classAction");
}
@end
