//
//  BaseView.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/10/24.
//

import UIKit

final class BaseView: UIView {
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
    
    let nextCoordinatorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Coordinator", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
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

extension BaseView {
    func setLabelText(_ text: String) {
        label.text = text + " 번째 코디네이터"
    }
}

extension BaseView {
    private func setHierarchy() {
        addSubview(label)
        addSubview(nextButton)
        addSubview(backButton)
        addSubview(nextCoordinatorButton)
        addSubview(backCoordinatorButton)
    }
    private func setUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        nextCoordinatorButton.translatesAutoresizingMaskIntoConstraints = false
        backCoordinatorButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nextCoordinatorButton.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            nextCoordinatorButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            backCoordinatorButton.topAnchor.constraint(equalTo: nextCoordinatorButton.bottomAnchor, constant: 20),
            backCoordinatorButton.centerXAnchor.constraint(equalTo: centerXAnchor)
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
