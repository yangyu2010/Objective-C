//
//  NSKVONotifying_Person.m
//  01-KVO实现
//
//  Created by YangYu on 2019/11/26.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "NSKVONotifying_Person.h"

@implementation NSKVONotifying_Person

- (void)setAge:(int)age {
    _NSSetIntValueAndNotify();
}

void _NSSetIntValueAndNotify()
{
    [self willChangeValueForKey:@"age"];
    [super setAge:age];
    [self didChangeValueForKey:@"age"];
}


- (void)didChangeValueForKey:(NSString *)key {

    // 通知监听器，某某属性值发生了改变
    [observer observeValueForKeyPath:key ofObject:self change:nil context:nil];
}

@end
