//
//  ViewController.m
//  01-KVO实现
//
//  Created by YangYu on 2019/11/26.
//  Copyright © 2019 YangYu. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, strong) Person *p1;
@property (nonatomic, strong) Person *p2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.p1 = [[Person alloc] init];
    self.p1.age = 1;
    
    self.p2 = [[Person alloc] init];
    self.p2.age = 2;
    
    Class c1 = object_getClass(self.p1);
    Class c2 = object_getClass(self.p2);
    NSLog(@"添加 KVO 之前的 Class: %@ %@", c1, c2);
    // 添加 KVO 之前的 Class: Person Person
    
    SEL s = @selector(setAge:);
    IMP imp1 = [self.p1 methodForSelector:s];
    IMP imp2 = [self.p2 methodForSelector:s];
    NSLog(@"添加 KVO 之前的 IMP: %p %p", imp1, imp2);
    // 添加 KVO 之前的 IMP: 0x10500c590 0x10500c590
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew;
    [self.p1 addObserver:self forKeyPath:@"age" options:options context:nil];
    
    c1 = object_getClass(self.p1);
    c2 = object_getClass(self.p2);
    NSLog(@"添加 KVO 之后的 Class: %@ %@", c1, c2);
    // 添加 KVO 之后的 Class: NSKVONotifying_Person Person
    
    NSLog(@"NSKVONotifying_Person 的父类: %@", class_getSuperclass(c1));
    
//    NSObject *obj1 = [[c1 alloc] init];
//    NSObject *obj2 = [[c2 alloc] init];
    
    NSLog(@"类对象 %p %p", c1, c2);
    NSLog(@"元类对象 %p %p", object_getClass(c1), object_getClass(c2));

    
    imp1 = [self.p1 methodForSelector:s];
    imp2 = [self.p2 methodForSelector:s];
    NSLog(@"添加 KVO 之后的 IMP: %p %p", imp1, imp2);
    // 添加 KVO 之后的 IMP: 0x105367216 0x10500c590
    // imp1 = 0x000000010331b216 (Foundation`_NSSetIntValueAndNotify)
    // imp2 = 0x0000000102fc0590 (01-KVO实现`-[Person setAge:] at Person.h:15)
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    // 都会触发KVO
//    [_p1 setAge:11];
//    [_p2 setAge:22];
//    _p1.age = 11;
//    _p2.age = 22;
    
//    self.p1.age = 11;
//    self.p2.age = 22;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);

    
    
}


@end
