//
//  Person.m
//  01-runtime
//
//  Created by Yu Yang on 2021/5/19.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod 000");
    
    return YES;
}



- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector== @selector(sayHello)) {
//        return [[NSObject alloc] init];
//    }
    
    NSLog(@"forwardingTargetForSelector 111");
    return [super forwardingTargetForSelector:aSelector];
}




- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    
    NSLog(@"methodSignatureForSelector 333");

    if (aSelector== @selector(sayHello)) {
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation 444");

}


//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (sel == @selector(sayHello)) {
//
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}


@end
