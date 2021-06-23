//
//  Person.h
//  01-runtime
//
//  Created by Yu Yang on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *idf;

- (void)printf;

@end

NS_ASSUME_NONNULL_END
