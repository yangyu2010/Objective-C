//
//  main.m
//  Block
//
//  Created by YangYu on 2019/12/4.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

struct __block_impl {
    void *isa;        // 8
    int Flags;        // 4
    int Reserved;     // 4
    void *FuncPtr;    // 8
};

struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc; // 8
    int age;
};



int main(int argc, const char * argv[]) {
    @autoreleasepool {

        static int age = 10;
        void (^block1)(int a) = ^(int a){
            NSLog(@"%d", age);
        };
        
        
        NSLog(@"%@", [block1 class]);

//        NSLog(@"%@", [[block1 copy] class]);

        
//        // 堆：动态分配内存,需要程序员申请申请，也需要程序员自己管理内存
//        void (^block1)(void) = ^{
//            NSLog(@"Hello");
//        };
//
//        int age = 10;
//
//        void (^block2)(void) = ^{
//            NSLog(@"Hello - %d", age);
//        };
//
//        NSLog(@"%@ %@ %@", [block1 class], [block2 class], [^{
//            NSLog(@"%d", age);
//        } class]);

        
    }
    return 0;
}


void test() {
    void (^blockTest)(void) = ^(){
        NSLog(@"-----------");
    };
    
    blockTest();

    NSLog(@"%@", [blockTest class]);
    NSLog(@"%@", [[blockTest class] superclass]);
    NSLog(@"%@", [[[blockTest class] superclass] superclass]);
    NSLog(@"%@", [[[[blockTest class] superclass] superclass] superclass]);

//        __NSGlobalBlock__
//        __NSGlobalBlock
//        NSBlock
//        NSObject
            
            
}
