//
//  ViewController.m
//  01-runtime
//
//  Created by Yu Yang on 2021/5/19.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    
    
}

- (void)test3 {
    
    NSObject *obj = [[NSObject alloc] init];

    NSLog(@"%p", [NSObject class]);
    NSLog(@"%p", object_getClass([NSObject class]));

    /*
     2021-05-19 20:31:54.345878+0800 01-runtime[1401:504680] 0x218059eb0
     2021-05-19 20:31:55.194283+0800 01-runtime[1401:504680] 0x218059e60
     (lldb) p obj
     (NSObject *) $0 = 0x0000000280900930
     (lldb) memory read 0x0000000280900930
     0x280900930: b1 9e 05 18 a2 01 00 00 00 00 00 00 00 00 00 00  ................
     0x280900940: d1 42 06 18 a2 01 00 00 e0 81 a0 83 02 00 00 00  .B..............
     (lldb) p/x (0x000001a218059eb1 & 0x0000000ffffffff8)
     (long) $1 = 0x0000000218059eb0
     (lldb) p/x obj->isa
     (Class) $2 = 0x000001a218059eb1 NSObject
     (lldb) memory read 0x218059eb0
     0x218059eb0: 61 9e 05 18 a2 01 00 00 00 00 00 00 00 00 00 00  a...............
     0x218059ec0: 00 ee 70 83 02 00 00 00 0f 00 00 00 07 00 00 00  ..p.............
     (lldb) p/x (0x000001a218059e61 & 0x0000000ffffffff8)
     (long) $3 = 0x0000000218059e60
     (lldb)
     */
}


- (void)test2 {
    
    Person *person = [[Person alloc] init];
    
    NSLog(@"%p", [Person class]);
    NSLog(@"%p", object_getClass([Person class]));

    /*
     2021-05-19 20:25:13.841282+0800 01-runtime[1395:503239] 0x104498e80
     2021-05-19 20:25:14.593565+0800 01-runtime[1395:503239] 0x104498e58
     (lldb) p person
     (Person *) $0 = 0x0000000280be4b60
     (lldb) memory read 0x0000000280be4b60
     0x280be4b60: 81 8e 49 04 a1 01 00 00 00 00 00 00 00 00 00 00  ..I.............
     0x280be4b70: d1 42 06 18 a2 01 00 00 e0 c1 8e 83 02 00 00 00  .B..............
     (lldb) p/x (0x000001a104498e81 & 0x0000000ffffffff8)
     (long) $1 = 0x0000000104498e80
     (lldb) memory read 0x0000000104498e80
     0x104498e80: 59 8e 49 04 a1 01 00 00 b0 9e 05 18 02 00 00 00  Y.I.............
     0x104498e90: c0 4e cb 81 02 00 00 00 03 00 00 00 01 00 00 00  .N..............
     (lldb) p/x (0x000001a104498e59 & 0x0000000ffffffff8)
     (long) $2 = 0x0000000104498e58
     (lldb) p person
     (Person *) $3 = 0x0000000280be4b60
     (lldb) p person->isa
     (Class) $4 = Person
     (lldb) p/x person->isa
     (Class) $5 = 0x000001a104498e81 Person
     (lldb)
     */
}


- (void)test1 {
    
    NSObject *obj = [[NSObject alloc] init];
    NSLog(@"%p", [NSObject class]);
    NSLog(@"%p", object_getClass([NSObject class]));

    NSLog(@"%p", [UIViewController class]);
    NSLog(@"%p", object_getClass([UIViewController class]));

    /*
    2021-05-19 19:30:03.261060+0800 01-runtime[1382:496684] 0x218059eb0
    2021-05-19 19:30:03.261141+0800 01-runtime[1382:496684] 0x218059e60
    2021-05-19 19:30:03.261223+0800 01-runtime[1382:496684] 0x2180932b0
    2021-05-19 19:30:03.261275+0800 01-runtime[1382:496684] 0x2180932d8
    (lldb) x 0x218059eb0
    0x218059eb0: 61 9e 05 18 a2 01 00 00 00 00 00 00 00 00 00 00  a...............
    0x218059ec0: 00 fa 4c 81 02 00 00 00 0f 00 00 00 07 00 00 00  ..L.............
    (lldb) p 0x000001a218059e61 & 0x0000000ffffffff8
    (long) $0 = 8992956000
    (lldb) p/x (0x000001a218059e61 & 0x0000000ffffffff8)
    (long) $1 = 0x0000000218059e60
    (lldb) x 0x2180932b0
    0x2180932b0: d9 32 09 18 a2 01 00 00 90 ca 09 18 02 00 00 00  .2..............
    0x2180932c0: 80 be 6c 80 02 00 00 00 07 00 00 00 03 00 00 00  ..l.............
    (lldb) p/x (0x000001a2180932d9 & 0x0000000ffffffff8)
    (long) $2 = 0x00000002180932d8
    (lldb) x 0x00000002180932d8
    0x2180932d8: 61 9e 05 18 a2 01 00 00 b8 ca 09 18 02 00 00 00  a...............
    0x2180932e8: 00 85 6c 80 02 00 00 00 07 00 00 00 04 00 00 00  ..l.............
    */

}


@end
