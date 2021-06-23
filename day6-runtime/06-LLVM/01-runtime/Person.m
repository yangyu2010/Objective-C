//
//  Person.m
//  01-runtime
//
//  Created by Yu Yang on 2021/5/19.
//

#import "Person.h"

@implementation Person

- (void)printf {
    NSLog(@"my name is %@", self.name);
    NSLog(@"my id is %@", self.idf);

    
    NSLog(@"my name is %p", &_name);
    NSLog(@"my id is %p", &_idf);
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [super forwardInvocation:anInvocation];
    
    NSLog(@"%s", __FUNCTION__);
    
}

@end
