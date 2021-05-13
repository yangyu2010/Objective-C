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

//struct NSObject_IMPL {
//    Class isa;
//};
//
//struct Student_IMPL {
//    Class isa;
//    int _no;
//    int _age;
//};

@interface Student : NSObject
{
    @public
    int _no; //4
    NSString *_name; //8

}

@property (nonatomic, assign) int _height;

@end

@implementation Student
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"%zu, %zu",
              class_getInstanceSize([NSObject class]),
              class_getInstanceSize([Student class])
              );
        
        
//        const char bytes1[7] = { 0x05, 0x31, 0x32, 0x33, 0x34, 0x35, 0x00 }; // \0x512345
//        NSString *name = [NSString stringWithUTF8String:bytes1];
//        NSLog(@"%@", name);
        
        
        Student *s = [[Student alloc] init];
        s->_no = 3;
//        s->_age = 11;
        s->_name = @"a";
//        char* cstring = "Try harder";
//        s->_s = @"1";

//        NSString *name = @"abc";
//        NSString *name = [[NSString alloc] initWithFormat:@"abc"];;
//        s->_name = name;
//        NSData *c_string_data = [name dataUsingEncoding:NSUTF8StringEncoding];
//        char const *c_string = c_string_data.bytes;
//        NSLog(@"%s", c_string);

        
        
//
//        struct Student_IMPL *s_imp = (__bridge struct Student_IMPL *)s;
//        NSLog(@"%d", s_imp->_no);
//        NSLog(@"%d", s_imp->_age);

//        // 16(只有_no和_age)  24(加了_name)
//        NSLog(@"%zd", class_getInstanceSize([Student class]));
//        // 16(只有_no和_age)  32(加了_name)
//        NSLog(@"%zd", malloc_size((__bridge const void *)(s)));
        
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
