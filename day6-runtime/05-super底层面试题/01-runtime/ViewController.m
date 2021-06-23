//
//  ViewController.m
//  01-runtime
//
//  Created by Yu Yang on 2021/5/19.
//

#import "ViewController.h"
#import "Person.h"

@implementation ViewController


struct st {
    long long a;
    long long b;
};

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    long long a = 1;
//    long long b = 2;
//    long long c = 3;
//
//    struct st s = {1, 2};
//    NSLog(@"%p", &a);
//    NSLog(@"%p", &b);
//    NSLog(@"%p", &c);
//    NSLog(@"%p", &s);
//
//    NSLog(@"%p", &s.a);
//    NSLog(@"%p", &s.b);

    id cls = [Person class];
    void *obj = &cls;
    [(__bridge  id)obj printf];


//    Person *p = [[Person alloc] init];
//    [p printf];

    NSLog(@"%p", &cls);
    NSLog(@"%p", &obj);
//    NSLog(@"%p", p);
    NSLog(@"%p", [Person class]);

}

/*
2021-06-16 20:30:14.199856+0800 01-runtime[6829:933197] my name is <ViewController: 0x10200faa0>
2021-06-16 20:30:14.199942+0800 01-runtime[6829:933197] 0x16efe1298
2021-06-16 20:30:14.199981+0800 01-runtime[6829:933197] 0x283bfcac0
2021-06-16 20:30:14.200018+0800 01-runtime[6829:933197] 0x100e24f38
2021-06-16 20:30:14.200084+0800 01-runtime[6829:933197] 0x100e24f38
(lldb) memory read 0x16efe1298
0x16efe1298: 38 4f e2 00 01 00 00 00 a0 fa 00 02 01 00 00 00  8O..............
0x16efe12a8: 70 4e e2 00 01 00 00 00 27 76 d2 d9 01 00 00 00  pN......'v......
(lldb) memory read 0x283bfcac0
0x283bfcac0: 3d 4f e2 00 a1 01 00 00 00 00 00 00 00 00 00 00  =O..............
0x283bfcad0: d0 ca 10 54 75 83 00 00 b1 00 9e 83 02 00 00 00  ...Tu...........
(lldb) memory read 0x000001a100e24f3d
0x100e24f3d: 01 00 00 b0 8e 9f e5 01 00 00 00 80 36 ca 82 02  ............6...
0x100e24f4d: 00 00 00 03 00 00 00 03 00 00 00 04 33 ca 82 02  ............3...
(lldb) p/x (0x0000000ffffffff8ULL & 0x000001a100e24f3d)
(unsigned long long) $0 = 0x0000000100e24f38
(lldb)
 */




@end
