//
//  main.m
//  KVC
//
//  Created by YangYu on 2019/11/27.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Observe.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        p.age = 10;
        
        Observe *ob = [[Observe alloc] init];
        
        [p addObserver:ob forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        
        [p setValue:@20 forKey:@"age"];
//        [p setValue:@20 forKeyPath:@"age"];
        NSLog(@"%d", p.age);

    }
    return 0;
}
