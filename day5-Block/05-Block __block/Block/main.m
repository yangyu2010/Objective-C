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

//        __block int age = 10;
        __block Person *p = [[Person alloc] init];
        Person *p2 = [[Person alloc] init];
        
        void(^myBlock)(void) = ^{
//            age = 20;
            p = nil;
            NSLog(@"%d", p2.age);
//            NSLog(@"%d", age);
        };

        myBlock();
        
//        NSLog(@"----22-----%d", age);

    }
    return 0;
}


