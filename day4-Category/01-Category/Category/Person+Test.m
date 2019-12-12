//
//  Person+Test.m
//  Category
//
//  Created by YangYu on 2019/11/28.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person+Test.h"

@implementation Person (Test)

- (int)age {
    return 11;
}

- (void)setAge:(int)age {
    
}

- (void)test {
    NSLog(@"Test test");
}

+ (void)testClass {
    NSLog(@"Test testClass");
}

@end
