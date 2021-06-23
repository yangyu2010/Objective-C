//
//  ViewController.m
//  01-runtime
//
//  Created by Yu Yang on 2021/5/19.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"


typedef uint32_t mask_t;  // x86_64 & arm64 asm are less efficient with 16-bits

struct cj_bucket_t {
    SEL _sel;
    IMP _imp;
};

struct cj_cache_t {
    struct cj_bucket_t * _buckets;
    mask_t _mask;
    uint16_t _flags;
    uint16_t _occupied;
};

struct cj_class_data_bits_t {
    uintptr_t bits;
};

struct cj_objc_class {
    Class ISA;
    Class superclass;
    struct cj_cache_t cache;             // formerly cache pointer and vtable
    struct cj_class_data_bits_t bits;    // class_rw_t * plus custom rr/alloc flags
};

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    
//    [person sayHello];
//    [person sayCode];

    struct cj_objc_class *cj_pClass = (__bridge struct cj_objc_class *)([person class]);

//    for (mask_t i = 0; i<cj_pClass->cache._mask; i++) {
//        // 打印获取的 bucket
//        struct cj_bucket_t bucket = cj_pClass->cache._buckets[i];
//        NSLog(@"%@ - %p",NSStringFromSelector(bucket._sel),bucket._imp);
//    }
    
//    [person test];
    
//    ((void (*)(id, SEL))(void *)objc_msgSend)((id)person, sel_registerName("test"));

//    NSLog(@"%p", sel_registerName("test2"));
//    NSLog(@"%p", @selector(test));

    
}


@end
