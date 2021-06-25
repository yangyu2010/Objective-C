//
//  ViewController.m
//  Runloop
//
//  Created by Yu Yang on 2021/6/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


//typedef void (*CFRunLoopObserverCallBack)(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info);
//kCFRunLoopEntry = (1UL << 0),
//kCFRunLoopBeforeTimers = (1UL << 1),
//kCFRunLoopBeforeSources = (1UL << 2),
//kCFRunLoopBeforeWaiting = (1UL << 5),
//kCFRunLoopAfterWaiting = (1UL << 6),
//kCFRunLoopExit

void RunLoopObserverCallBack (CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    

    switch (activity) {
        case kCFRunLoopEntry: {
            CFRunLoopMode model = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
            NSLog(@"kCFRunLoopEntry %@", model);
            CFRelease(model);
            break;
        }
//        case kCFRunLoopBeforeTimers:
//            NSLog(@"kCFRunLoopBeforeTimers");
//            break;
//        case kCFRunLoopBeforeSources:
//            NSLog(@"kCFRunLoopBeforeSources");
//            break;
//        case kCFRunLoopBeforeWaiting:
//            NSLog(@"kCFRunLoopBeforeWaiting");
//            break;
//        case kCFRunLoopAfterWaiting:
//            NSLog(@"kCFRunLoopAfterWaiting");
//            break;
        case kCFRunLoopExit: {
            CFRunLoopMode model = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
            NSLog(@"kCFRunLoopExit %@", model);
            CFRelease(model);
            break;
        }
        default:
            break;
    }
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [NSRunLoop currentRunLoop]);
    
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, RunLoopObserverCallBack , nil);

    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);

    CFRelease(observer);
    
//    CFRunLoopMode model = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
//    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, model);
//    CFRelease(model);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%s", __func__);
    
    [NSTimer scheduledTimerWithTimeInterval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%s", __func__);
    }];

}


@end
