//
//  main.m
//  09-isa指针
//
//  Created by YangYu on 2019/11/7.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import <Foundation/Foundation.h>



// MJPerson
@interface Person : NSObject <NSCopying>
{
@public
    int _age;
}
@property (nonatomic, assign) int no;
- (void)personInstanceMethod;
+ (void)personClassMethod;
@end

@implementation Person

- (void)test
{
    
}

- (void)personInstanceMethod
{
    
}
+ (void)personClassMethod
{
    
}
- (id)copyWithZone:(NSZone *)zone
{
    return nil;
}
@end

// MJStudent
@interface Student : Person <NSCoding>
{
@public
    int _weight;
}
@property (nonatomic, assign) int height;
- (void)studentInstanceMethod;
+ (void)studentClassMethod;
@end

@implementation Student
- (void)test
{
    
}
- (void)studentInstanceMethod
{
    
}
+ (void)studentClassMethod
{
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        [p personInstanceMethod];
        
        [Person personClassMethod];
        
        Student *s = [[Student alloc] init];
        [s studentInstanceMethod];
        [s personInstanceMethod];
        
        [Student studentClassMethod];
        [Student personClassMethod];
        [Student load];
        
        
    }
    return 0;
}




