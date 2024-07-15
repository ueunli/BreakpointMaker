//
//  ModalViewController.swift
//  BreakpointMaker
//
//  Created by junely on 7/10/24.
//

import UIKit

final class ModalViewController: UIViewController {
    
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func changeTitle(to sdkName: String) {
        var title = "I love \(sdkName) "
        if sdkName == "Hive" {
            title += "the best sdk ever"
        }
        DispatchQueue.main.async {
            self.titleLabel.text = title
        }
    }
    
}
