//
//  Person.m
//  KVC
//
//  Created by YangYu on 2019/11/27.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person.h"

@implementation Person

//- (void)setAge:(int)age {
//    NSLog(@"setAge: %d", age);
//}

//- (void)_setAge:(int)age {
//    NSLog(@"_setAge: %d", age);
//}

//- (void)setIsAge:(int)age {
//    NSLog(@"_setIsAge: %d", age);
//}

- (void)_setIsAge:(int)age {
    NSLog(@"_setIsAge: %d", age);
}

+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

@end


@implementation Cat
@end
