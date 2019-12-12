//
//  Person+Test.m
//  Category
//
//  Created by YangYu on 2019/12/2.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person+Test.h"
#import <objc/runtime.h>

@implementation Person (Test)


- (void)setName:(NSString *)name {
    
    NSLog(@"%p", @selector(name));
    
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);

//    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    NSLog(@"%p", @selector(name));

    return objc_getAssociatedObject(self, @selector(name));

//    return objc_getAssociatedObject(self, @"name");
}

@end
