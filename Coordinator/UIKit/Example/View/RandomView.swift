//
//  RandomView.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/11/24.
//

import UIKit

final class RandomView: UIView {
    private let label = UILabel()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    let rootPopButton: UIButton = {
        let button = UIButton()
        button.setTitle("popToRoot", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    let randomPopButton: UIButton = {
        let button = UIButton()
        button.setTitle("randomPop", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
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

extension RandomView {
    func setLabelText(_ text: String) {
        label.text = text 
    }
}

extension RandomView {
    private func setHierarchy() {
        addSubview(label)
        addSubview(nextButton)
        addSubview(backButton)
        addSubview(rootPopButton)
        addSubview(randomPopButton)
    }
    private func setUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        rootPopButton.translatesAutoresizingMaskIntoConstraints = false
        randomPopButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
        let buttons = [nextButton, backButton, rootPopButton, randomPopButton]
        
        for index in buttons.indices {
            let constraint: NSLayoutConstraint
            if index == 0 {
                constraint = buttons[index].topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
            } else {
                constraint = buttons[index].topAnchor.constraint(equalTo: buttons[index-1].bottomAnchor, constant: 20)
            }
            NSLayoutConstraint.activate([
                constraint,
                buttons[index].centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        }
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
