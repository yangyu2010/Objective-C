//
//  Person+Test.m
//  Category
//
//  Created by YangYu on 2019/12/2.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person+Test.h"

#import <AppKit/AppKit.h>

@implementation Person (Test)

NSMutableDictionary *weights_;

+ (void)load {
    [super load];
    weights_ = [NSMutableDictionary dictionary];
}

- (void)setWeight:(int)weight {

    NSString *key = [NSString stringWithFormat:@"%p", self];
    weights_[key] = @(weight);
}

- (int)weight {
    NSString *key = [NSString stringWithFormat:@"%p", self];
    return [weights_[key] intValue];
}

@end
