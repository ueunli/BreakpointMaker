//
//  02_Exception.swift
//  BreakpointMaker
//
//  Created by junely on 7/9/24.
//

import UIKit

extension ViewController {
    
    @objc
    func throwException() {
        let array = NSArray(array: ["H", "i", "v", "e"])
        
        for index in 0 ... array.count {
            let _ = array[index]
        }
    }
    
}
