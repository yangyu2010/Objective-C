//
//  Person.m
//  01-KVO实现
//
//  Created by YangYu on 2019/11/26.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age {
    _age = age;
    
    NSLog(@"setAge");
}

- (void)willChangeValueForKey:(NSString *)key {
    [super willChangeValueForKey:key];
    
    NSLog(@"willChangeValueForKey");
}

- (void)didChangeValueForKey:(NSString *)key {
    
    NSLog(@"didChangeValueForKey-begin");

    [super didChangeValueForKey:key];
    
    NSLog(@"didChangeValueForKey-end");
}

@end
