//
//  main.swift
//  03-自定义对象的本质-Swift
//
//  Created by YangYu on 2019/11/6.
//  Copyright © 2019 YangYu. All rights reserved.
//

import Foundation

struct Person {
//    var age: Int = 0
    let gender: Bool
//    var name: String = ""
    
    init(gender: Bool, age: Int) {
        self.gender = gender
//        self.age = age
    }
}

var p = Person(gender: true, age: 11)

let structInstanceAddress = MemoryAddress(of: &p)
print(structInstanceAddress)

// print(p.name, p.age)

let size = MemoryLayout<Person>.size
print(size)

let instanceSize = MemoryLayout<Person>.size(ofValue: p)
print(instanceSize)
