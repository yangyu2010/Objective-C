//
//  Person.m
//  01-runtime
//
//  Created by Yu Yang on 2021/5/19.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person


struct method_t {
    SEL sel;
    char *types;
    IMP imp;
};

//- (void)sayHello{
//    NSLog(@"TCJPerson say : %s",__func__);
//}

- (void)test {
    NSLog(@"%s",__func__);
}


+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod333 ");
//    NSString *stringSEL = NSStringFromSelector(sel);
//    if ([stringSEL isEqualToString:@""]) {
//    }
    
    Method m = class_getInstanceMethod(self, @selector(test));
//    struct method_t *mt = (struct method_t *)m;
//    NSLog(@"%s %s %p", mt->sel, mt->types, mt->imp);
    
    if (sel == @selector(sayHello)) {
        class_addMethod(self, sel, method_getImplementation(m), method_getTypeEncoding(m));
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}


//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"resolveInstanceMethod333 ");
//
//
//    Method m = class_getInstanceMethod(self, @selector(test));
//    struct method_t *mt = (struct method_t *)m;
//    NSLog(@"%s %s %p", mt->sel, mt->types, mt->imp);
//
//    return [super resolveInstanceMethod:sel];
//}


//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"resolveInstanceMethod333 ");
////    NSString *stringSEL = NSStringFromSelector(sel);
////    if ([stringSEL isEqualToString:@""]) {
////    }
//
//    Method m = class_getInstanceMethod(self, @selector(test));
//    struct method_t *mt = (struct method_t *)m;
////    NSLog(@"%s %s %p", mt->sel, mt->types, mt->imp);
//
//    if (sel == @selector(sayHello)) {
//        class_addMethod(self, sel, mt->imp, mt->types);
//        return YES;
//    }
//
//    return [super resolveInstanceMethod:sel];
//}


@end
