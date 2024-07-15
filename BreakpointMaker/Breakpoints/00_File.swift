//
//  00_File.swift
//  BreakpointMaker
//
//  Created by junely on 7/9/24.
//

import UIKit

fileprivate struct SomeStruct {
    
    func someLongMethod() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let mapped = numbers.map { $0 * 2 }
        let filtered = mapped.filter { $0 % 3 == 0 }
        let reduced = filtered.reduce([]) { $0 + [$1] }
        reduced.forEach {
            print($0, terminator: " ")
        }
    }
    
    func someWideMethod() {
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        numbers.map { $0 * 2 }.filter { $0 % 3 == 0 }.reduce([]) { $0 + [$1] }.forEach { print($0, terminator: " ") }
    }
    
}

extension ViewController {
    
    @objc
    func someComplicatedMethod() {
        let someStruct = SomeStruct()
        someStruct.someLongMethod()
        someStruct.someWideMethod()
    }
    
}
