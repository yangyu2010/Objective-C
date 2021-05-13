//
//  MemoryAdressHelper.swift
//  03-自定义对象的本质-Swift
//
//  Created by YangYu on 2019/11/6.
//  Copyright © 2019 YangYu. All rights reserved.
//

// MARK: - 辅助函数 打印内存地址

struct MemoryAddress<T>: CustomStringConvertible {
    let intValue: Int

    var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }

    // for structures
    init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

extension MemoryAddress where T: AnyObject {
    // for classes
    init(of classInstance: T) {
        intValue = unsafeBitCast(classInstance, to: Int.self)
        // or      Int(bitPattern: Unmanaged<T>.passUnretained(classInstance).toOpaque())
    }
}
