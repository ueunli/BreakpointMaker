//
//  05_ConstraintError.swift
//  BreakpointMaker
//
//  Created by junely on 7/9/24.
//

import UIKit

fileprivate extension UIColor {
    
    static let hiveBlue = UIColor.systemBlue
    static let com2usRed = UIColor.systemRed
    
}

extension ViewController {
    
    @objc
    func generateConstraintError() {
        let view1 = UIView()
        view1.backgroundColor = .hiveBlue
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        let view2 = UIView()
        view2.backgroundColor = .com2usRed
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        view.insertSubview(view1, at: 0)
        view.insertSubview(view2, at: 0)
        
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.topAnchor),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            view2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            view2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7),
            
            view1.bottomAnchor.constraint(equalTo: view2.topAnchor)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            view1.removeFromSuperview()
            view2.removeFromSuperview()
        }
    }
    
}
