//
//  main.m
//  02-自定义对象的本质
//
//  Created by YangYu on 2019/11/5.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

/**
 编译后
 
struct NSObject_IMPL {
    Class isa;
};

struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
};
*/

struct NSObject_IMPL {
    Class isa;
};

struct Student_IMPL {
    Class isa;
    int _no;
    int _age;
};

@interface Student : NSObject
{
    @public
    int _no;
    int _age;
}
@end

@implementation Student
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Student *s = [[Student alloc] init];
        s->_no = 3;
        s->_age = 11;

//        struct Student_IMPL *s_imp = (__bridge struct Student_IMPL *)s;
//        NSLog(@"%d", s_imp->_no);
//        NSLog(@"%d", s_imp->_age);

        // 16(只有_no和_age)  24(加了_name)
        NSLog(@"%zd", class_getInstanceSize([Student class]));
        // 16(只有_no和_age)  32(加了_name)
        NSLog(@"%zd", malloc_size((__bridge const void *)(s)));
        
        // memory read 0x1005254c0
        // 读取对象的内存地址
        /**
        0x1005254c0: a9 11 00 00 01 80 1d 00 03 00 00 00 0b 00 00 00  ................
        0x1005254d0: a0 55 52 00 01 00 00 00 e0 57 52 00 01 00 00 00  .UR......WR.....
         */
        
        // memory write 0x1005254c8 4
        // 修改内存的值
        // 03 00 00 00 是_no的值
        // 0b 00 00 00 是_age的值 11
        // 把_no的值修改成4
    }
    return 0;
}
