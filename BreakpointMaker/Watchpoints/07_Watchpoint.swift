//
//  07_Watchpoint.swift
//  BreakpointMaker
//
//  Created by junely on 7/11/24.
//

import UIKit

extension ViewController {
    
    @objc
    func handleSwipeUp(_ gesture: UIPanGestureRecognizer) {
        let velocity = gesture.velocity(in: view)
        let maxLength = view.frame.height * -0.3
        
        guard gesture.state == .ended,
              velocity.y.isLess(than: maxLength) else { return }
        
        let vc = ModalViewController()
        present(vc, animated: true) {
            vc.changeTitle(to: "Hive")
        }
    }
    
}
