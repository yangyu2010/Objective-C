//
//  main.m
//  Block
//
//  Created by YangYu on 2019/12/4.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

int num = 10;
NSString *banji = @"2";

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        int age = 10;
        NSString *str = @"abc";
        static double height = 178.0;
        static NSString *name = @"Jack";
        void (^block1)(void) = ^{
            NSLog(@"%d", age);
            NSLog(@"%@", str);
            
            NSLog(@"%f", height);
            NSLog(@"%@", name);

            
            NSLog(@"%d", num);
            NSLog(@"%@", banji);
        };
        
        block1();
    }
    return 0;
}
