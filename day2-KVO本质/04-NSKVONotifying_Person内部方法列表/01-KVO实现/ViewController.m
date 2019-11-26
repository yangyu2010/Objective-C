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
    
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew;
    [self.p1 addObserver:self forKeyPath:@"age" options:options context:nil];
    
    NSObject *obj = [[NSObject alloc] init];
    
    Class cls1 = object_getClass(self.p1);
    Class cls2 = object_getClass(self.p2);
    Class cls3 = object_getClass(obj);

    NSString *methodList1 = [self printPersonMethods:cls1];
    NSString *methodList2 = [self printPersonMethods:cls2];
//    NSString *methodList3 = [self printPersonMethods:cls3];

    NSLog(@"%@ %@", cls1, methodList1);
    NSLog(@"%@ %@", cls2, methodList2);
//    NSLog(@"%@ %@", cls3, methodList3);

    /**
     
    NSKVONotifying_Person [
                           setAge:
                           class
                           dealloc
                           _isKVOA
                           ]
    Person [
            setAge:
            age
            ]
     */
    
    NSLog(@"%@ %@", [self.p1 class], [self.p2 class]);
    // Person Person
    // 重新了 - (Class)class 方法
    
    NSLog(@"%@ %@", object_getClass(self.p1), object_getClass(self.p2));
    // NSKVONotifying_Person Person
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    self.p1.age = 11;
    
    // 手动触发KVO
//    [self.p1 willChangeValueForKey:@"age"];
//    [self.p1 didChangeValueForKey:@"age"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
    
}


- (NSString *)printPersonMethods:(id)obj {
    
    unsigned int count = 0;
    Method *methods = class_copyMethodList([obj class],&count);
    NSMutableString *methodList = [NSMutableString string];
    [methodList appendString:@"[\n"];
    for (int i = 0; i<count; i++) {
        Method method = methods[i];
        SEL sel = method_getName(method);
        [methodList appendFormat:@"%@",NSStringFromSelector(sel)];
        [methodList appendString:@"\n"];
    }
    
    [methodList appendFormat:@"]"];
    
    free(methods);
    
    return methodList;
}

@end
