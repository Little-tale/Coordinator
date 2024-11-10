//
//  BaseView.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/10/24.
//

import UIKit

final class BaseView: UIView {
    private let label = UILabel()
    
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

extension BaseView {
    func setLabelText(_ text: String) {
        label.text = text
    }
}

extension BaseView {
    private func setHierarchy() {
        addSubview(label)
    }
    private func setUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setColor() {
        let red = randomCGFloat
        let green = randomCGFloat
        let blue = randomCGFloat
        
        self.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        self.label.textColor = UIColor(red: 1 - red, green: 1 - green, blue: 1 - blue, alpha: 1)
    }
    
    private var randomCGFloat: CGFloat {
        let random = Double.random(in: 0...255)
        return CGFloat(random / 255)
    }
}
