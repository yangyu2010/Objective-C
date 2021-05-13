//
//  main.m
//  review
//
//  Created by Yu Yang on 2020/5/11.
//  Copyright © 2020 Yu Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        dispatch_queue_t concurrentQueue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
        
        for (NSInteger i = 0; i < 10; i++) {
            
            dispatch_sync(concurrentQueue, ^{
                
                NSLog(@"%zd",i);
            });
        }
        
        dispatch_barrier_sync(concurrentQueue, ^{
           
            NSLog(@"barrier");
        });
        
        dispatch_barrier_async(concurrentQueue, ^{
                  
                   NSLog(@"1111111");
               });
        
        for (NSInteger i = 10; i < 20; i++) {
            
            dispatch_sync(concurrentQueue, ^{
                
                NSLog(@"%zd",i);
            });
        }
        
        
    }
    return 0;
}
