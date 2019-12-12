//
//  Person.m
//  KVC
//
//  Created by YangYu on 2019/11/27.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)willChangeValueForKey:(NSString *)key {
    [super willChangeValueForKey:key];
    NSLog(@"willChangeValueForKey");
}


- (void)didChangeValueForKey:(NSString *)key {
    NSLog(@"didChangeValueForKey - 1");

    [super didChangeValueForKey:key];
    
    NSLog(@"didChangeValueForKey - 2");

}

@end


@implementation Cat
@end
