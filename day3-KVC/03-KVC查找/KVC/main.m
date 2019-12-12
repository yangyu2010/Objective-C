//
//  main.m
//  KVC
//
//  Created by YangYu on 2019/11/27.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        
        [p setValue:@20 forKey:@"age"];

        // setAge _setAge
        // accessInstanceVariablesDirectly
        // _age _isAge age isAge
    }
    return 0;
}
