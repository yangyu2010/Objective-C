//
//  Person+Test.h
//  Category
//
//  Created by YangYu on 2019/12/2.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <AppKit/AppKit.h>


#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Test)

@property (nonatomic, copy) NSString *name;

//@property (nonatomic, copy, class) NSString *;

@end

NS_ASSUME_NONNULL_END
