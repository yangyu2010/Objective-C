//
//  main.m
//  KVC
//
//  Created by YangYu on 2019/11/27.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        p.age = 10;
        
//        [p setValue:@20 forKey:@"age"];
        [p setValue:@20 forKeyPath:@"age"];
        NSLog(@"%d", p.age);
        
        p.cat = [[Cat alloc] init];
        [p setValue:@2 forKeyPath:@"cat.height"];
        NSLog(@"%d", p.cat.height);

    }
    return 0;
}
