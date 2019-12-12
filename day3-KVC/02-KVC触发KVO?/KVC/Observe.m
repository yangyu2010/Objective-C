//
//  Observe.m
//  KVC
//
//  Created by YangYu on 2019/11/28.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Observe.h"

@implementation Observe

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {

    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);

}

@end
