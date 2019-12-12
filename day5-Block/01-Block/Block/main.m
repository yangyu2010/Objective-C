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
    size_t reserved;    // 8
    size_t Block_size;  // 8
};

struct __main_block_impl_0 {
    struct __block_impl impl;           // 24
    struct __main_block_desc_0* Desc;   // 8
};



int main(int argc, const char * argv[]) {
    @autoreleasepool {

    }
    return 0;
}


void test2() {
    
    typedef struct a
    {
        int c;          // 4
        double d;       // 8
        char b[10];     // 10
    }test;
    test  e;
    printf("%d \n", sizeof(test)); // 32

    // 实际值
    // 8
    // 8
    // 10
    
    // 26 要是8的倍数 想上扩充
    
    // 32
    
}

void test() {

    // 没有引用值的 Block 占用了 32个字节
    // struct __block_impl impl;            24
    // struct __main_block_desc_0* Desc;    8 是结构体指针 注意了 不是结构体
    
    
    printf("size_t bytes = %lu\n" ,sizeof(size_t));
    printf("int bytes = %lu\n" ,sizeof(int));
    printf("void * bytes = %lu\n" ,sizeof(void *));

    
    void (^blockTest)(void) = ^(){
        NSLog(@"-------");
    };
    
    struct __main_block_impl_0 *impl = (__bridge struct __main_block_impl_0 *)blockTest;
    
    blockTest();

    printf("size_t bytes = %lu\n" ,sizeof(size_t));

    

    //        typedef struct a
    //        {
    //            size_t reserved;    // 8
    //            size_t Block_size;  // 8
    //        }test;
    //        test  e;
            struct __main_block_impl_0 test;
            printf("%d \n", sizeof(test)); // 32

}
