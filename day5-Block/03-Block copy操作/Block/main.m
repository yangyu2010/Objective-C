//
//  main.m
//  Block
//
//  Created by YangYu on 2019/12/4.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MyBlock)(void);

MyBlock myblock()
{
    int age = 10;
//    return ^{
//           NSLog(@"------------%d", age);
//       };
    // Returning block that lives on the local stack
    
    return [^{
       NSLog(@"------------%d", age);
    } copy];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        MyBlock bl = myblock();
//        bl();
//        NSLog(@"%@", [bl class]);

        int age = 10;
        MyBlock bl = ^{
            NSLog(@"------------%d", age);
        };
        NSLog(@"%@", [bl class]);
        
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
