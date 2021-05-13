//
//  Person+Test.h
//  Category
//
//  Created by YangYu on 2019/11/28.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Test)

@property (nonatomic, assign) int age;

- (void)test1;
+ (void)testClass1;

@end

NS_ASSUME_NONNULL_END
