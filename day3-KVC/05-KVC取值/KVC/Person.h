//
//  Person.h
//  KVC
//
//  Created by YangYu on 2019/11/27.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Cat;

NS_ASSUME_NONNULL_BEGIN


@interface Person : NSObject
{
    @public
    int _age;
//    int _isAge;
//    int age;
//    int isAge;
}

//@property (nonatomic, assign) int age;

@end


@interface Cat : NSObject
@property (nonatomic, assign) int height;
@end



NS_ASSUME_NONNULL_END
