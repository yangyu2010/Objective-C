//
//  ViewController.m
//  GCD
//
//  Created by Yu Yang on 2021/7/2.
//

#import "ViewController.h"
#import<libkern/OSAtomic.h>

@interface ViewController ()

@property (assign, nonatomic) int money;
@property (assign, nonatomic) int ticketsCount;

@property (nonatomic, assign) OSSpinLock moneyLock;
@property (nonatomic, assign) OSSpinLock ticketLock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self moneyTest];
    [self ticketTest];
    
    self.moneyLock = OS_SPINLOCK_INIT;
    self.ticketLock = OS_SPINLOCK_INIT;
}

/**
 存钱、取钱演示
 */
- (void)moneyTest
{
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saveMoney];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __drawMoney];
        }
    });
}

/**
 存钱
 */
- (void)__saveMoney
{
    OSSpinLockLock(&_moneyLock);

    int oldMoney = self.money;
    sleep(.2);
    oldMoney += 50;
    self.money = oldMoney;
    
    NSLog(@"存50，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
    
    OSSpinLockUnlock(&_moneyLock);

}

/**
 取钱
 */
- (void)__drawMoney
{
    OSSpinLockLock(&_moneyLock);

    int oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20，还剩%d元 - %@", oldMoney, [NSThread currentThread]);
    
    OSSpinLockUnlock(&_moneyLock);

}

/**
 卖1张票
 */
- (void)__saleTicket
{
    OSSpinLockLock(&_ticketLock);
    
    int oldTicketsCount = self.ticketsCount;
    sleep(.2);
    oldTicketsCount--;
    self.ticketsCount = oldTicketsCount;
    NSLog(@"还剩%d张票 - %@", oldTicketsCount, [NSThread currentThread]);
    
    OSSpinLockUnlock(&_ticketLock);
}

/**
 卖票演示
 */
- (void)ticketTest
{
    self.ticketsCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self __saleTicket];
        }
    });
}

@end
