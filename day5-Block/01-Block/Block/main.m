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

        
//        ^{
//            NSLog(@"this is a block");
//            NSLog(@"this is a block");
//            NSLog(@"this is a block");
//        };
        
//        void (^block)(void) = ^{
//            NSLog(@"this is a block");
//            NSLog(@"this is a block");
//        };
//
//        block();
        
//        void (^block) (int a, int b) = ^(int a, int b){
//            NSLog(@"%d %d", a, b);
//        };
//
//        block(1,2);
        
        auto int a = 10;
        static int b = 20;
        void (^block)(void) = ^{
            NSLog(@"22222 %d %d %d", a, b , num);
        };
        
        a = 50;
        b = 60;
        num = 70;
        NSLog(@"%d %d %d", a, b , num);

        block();
        
//        int age = 10;
//        NSString *str = @"abc";
//        static double height = 178.0;
//        static NSString *name = @"Jack";
//        void (^block1)(void) = ^{
//            NSLog(@"%d", age);
//            NSLog(@"%@", str);
//
//            NSLog(@"%f", height);
//            NSLog(@"%@", name);
//
//
//            NSLog(@"%d", num);
//            NSLog(@"%@", banji);
//        };
//
//        block1();
    }
    return 0;
}
