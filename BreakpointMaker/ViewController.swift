//
//  ViewController.swift
//  BreakpointMaker
//
//  Created by junely on 7/9/24.
//

import UIKit

fileprivate enum Breakpoint: String, CaseIterable {
    case file
    case swiftError
    case symbolic
    case exception
    case runtimeIssue
    case layoutConstraint
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let buttons = Breakpoint.allCases.map {
            let button = UIButton(type: .roundedRect)
            button.setTitle($0.rawValue, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.layer.cornerRadius = view.frame.width * 0.01
            button.addTarget(self, action: action(for: $0), for: .touchUpInside)
            button.widthAnchor.constraint(equalToConstant: button.intrinsicContentSize.width + 10).isActive = true
            return button
        }
        
        let stackV = UIStackView(arrangedSubviews: buttons)
        stackV.axis = .vertical
        stackV.alignment = .center
        stackV.distribution = .equalSpacing
        stackV.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackV)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            stackV.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackV.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackV.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            stackV.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        let swipeUpGesture = UIPanGestureRecognizer(target: self, action: #selector(handleSwipeUp))
        view.addGestureRecognizer(swipeUpGesture)
    }
    
    private func action(for breakpoint: Breakpoint) -> Selector {
        switch breakpoint {
        case .file: return #selector(someComplicatedMethod)
        case .swiftError: return #selector(throwError)
        case .exception: return #selector(throwException)
        case .symbolic: return #selector(someMethod)
        case .runtimeIssue: return #selector(generateRuntimeIssue)
        case .layoutConstraint: return #selector(generateConstraintError)
        }
    }

}
