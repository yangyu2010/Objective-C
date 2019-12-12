//
//  main.m
//  Block
//
//  Created by YangYu on 2019/12/4.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

typedef void(^Block)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        /**
        Person *p = [[Person alloc] init];
        p.age = 10;
        Block block = ^{
            NSLog(@"%d", p.age);    //20
        };
        p.age = 20;
        block();
        */
        
        
        /**
        Block block;
        {
            Person *p = [[Person alloc] init];
            p.age = 10;

//            block = [^{
//                NSLog(@"%d", p.age);
//            } copy];
            
            block = ^{
                NSLog(@"%d", p.age);
            };
            
            [p release];
        }
        NSLog(@"------------");
        */
        
        Block block;
        {
            Person *p = [[Person alloc] init];
            p.age = 10;

//            __weak Person *weakP = p;
            block = ^{
                NSLog(@"%d", p.age);
            };
            
            NSLog(@"%@", [block class]);

        }
        NSLog(@"------------");
        
        block();
    }
    return 0;
}


