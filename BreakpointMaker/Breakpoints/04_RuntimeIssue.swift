//
//  04_RuntimeIssue.swift
//  BreakpointMaker
//
//  Created by junely on 7/9/24.
//

import UIKit

fileprivate class SomeClass {
    
    var count = 0
    let oddIncrementer  = DispatchQueue(label: "com.hive.odd" , attributes: .concurrent)
    let evenIncrementer = DispatchQueue(label: "com.hive.even", attributes: .concurrent)
    
    func tackleThreadSanitizer() {
        for number in 1 ... 10 {
            if number % 2 == 1 {
                oddIncrementer.async  { self.count += number }
            } else {
                evenIncrementer.async { self.count += number }
            }
        }
    }
    
    func tackleMainThreadChecker(vc: UIViewController) {
        let hiveBlue = UIColor.systemBlue
        let currentColor = vc.view.backgroundColor
        let isHiveBlue = currentColor == hiveBlue
        
        DispatchQueue.global().async {
            vc.view.backgroundColor = isHiveBlue ? .white : hiveBlue
        }
    }
    
}

extension ViewController {
    
    @objc
    func generateRuntimeIssue() {
        let someClass = SomeClass()
        someClass.tackleMainThreadChecker(vc: self)
        someClass.tackleThreadSanitizer()
    }
    
}
