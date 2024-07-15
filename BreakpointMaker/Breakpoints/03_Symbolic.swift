//
//  03_Symbolic.swift
//  BreakpointMaker
//
//  Created by junely on 7/9/24.
//

import UIKit

fileprivate struct SomeStruct {
    
    func someMethod() {
        print(#function)
    }
    
}

extension ViewController {
    
    @objc
    func someMethod() {
        print(#function)
    }
    
}
