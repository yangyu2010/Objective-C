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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.p1 = [[Person alloc] init];
    self.p1.age = 1;
   
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew;
    [self.p1 addObserver:self forKeyPath:@"age" options:options context:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    self.p1.age = 11;
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
    
}


@end
