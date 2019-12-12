//
//  main.m
//  iOS内存分布
//
//  Created by YangYu on 2019/12/5.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int a = 10;
NSString *b;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        int c;
        double u = 9.9;
        NSString *d = @"ddddd";
        
        static NSString *e = @"eeeee";
        static int f = 1;
        
        NSObject *o = [[NSObject alloc] init];
        NSView *v = [[NSView alloc] init];
        
        NSLog(@"a %p", &a);
        NSLog(@"b %p", &b);
        NSLog(@"c %p", &c);
        NSLog(@"d %p", d);
        NSLog(@"e %p", e);
        NSLog(@"f %p", &f);
        NSLog(@"o %p", o);
        NSLog(@"v %p", v);
        NSLog(@"----");
        NSLog(@"o %p", &o);
        NSLog(@"v %p", &v);
        NSLog(@"----");

        NSLog(@"u %p", &u);
        NSLog(@"w %p", [NSObject alloc]);
        NSLog(@"v %p", malloc(8));

        
        /*
         a 0x1000011c8
         b 0x1000011e0
         c 0x7ffeefbff47c
         d 0x100001048
         e 0x100001068
         f 0x1000011d8
         o 0x102022130
         v 0x10202ae20
         u 0x7ffeefbff470
        */
        
        
        /*
         字符串常量
         d 0x100001048

         已初始化的全局变量 静态变量
         e 0x100001068
         a 0x1000011c8
         f 0x1000011d8

         未初始化的全局变量 静态变量
         b 0x1000011e0

         堆 ⬇️
         o 0x102022130
         v 0x10202ae20

         栈 ⬆️
         u 0x7ffeefbff470
         c 0x7ffeefbff47c

         &0 0x7ffeefbff460
         &v 0x7ffeefbff458
         */
        
        /*
         NSObject *o = [[NSObject alloc] init];
         o对象是在栈里 因为是局部变量 o指向了NSObject的地址
         后面的NSObject是在堆里, 因为是alloc出来的
         */
        
    }
    return 0;
}
