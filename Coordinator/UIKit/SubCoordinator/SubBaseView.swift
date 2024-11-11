//
//  SubBaseView.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/11/24.
//

import UIKit

final class SubBaseView: UIView {
   
    let backCoordinatorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back Coordinator", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setUI()
        setColor()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SubBaseView {
    private func setHierarchy() {
        addSubview(backCoordinatorButton)
    }
    private func setUI() {

        backCoordinatorButton.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            backCoordinatorButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            backCoordinatorButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setColor() {
        let red = randomCGFloat
        let green = randomCGFloat
        let blue = randomCGFloat
        
        self.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    private var randomCGFloat: CGFloat {
        let random = Double.random(in: 0...255)
        return CGFloat(random / 255)
    }
}
