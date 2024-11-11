//
//  FirstCoordinator.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/11/24.
//

import UIKit

final class FirstCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController?
    
    private var count = 0
    
    init() {
        navigationController = UINavigationController()
    }
    
    func start() {}
    
    func startGetNavigation() -> UINavigationController? {
        let first = RandomViewController()
        navigationController?.setViewControllers([first], animated: true)
        guard let navigationController else { print("nil") ; return nil }
        
        count(1)
        first.baseView.setLabelText(String(count) + " 번째 화면")
        setAction(first)
        return navigationController
    }
}

extension FirstCoordinator {
    func setAction(_ view: RandomViewController) {
        view.baseView.nextButton.addAction(UIAction.guardSelf(self, handler: { owner, _ in
            let next = RandomViewController()
            owner.next(viewController: next)
            owner.count(1)
            next.baseView.setLabelText(String(owner.count) + " 번째 화면")
            owner.setAction(next)
        }), for: .touchUpInside)
        
        
        view.baseView.backButton.addAction(UIAction.guardSelf(self, handler: { owner, _ in
            if owner.count == 1 { return }
            owner.count(-1)
            owner.back(animated: true)
        }),for: .touchUpInside)
        
        view.baseView.rootPopButton.addAction(UIAction.guardSelf(self, handler: { owner, _ in
            owner.count(-(owner.count - 1))
            owner.rootPop()
        }), for: .touchUpInside)
        
        view.baseView.randomPopButton.addAction(UIAction.guardSelf(self, handler: { owner, _ in
            if owner.count == 1 { return }
            let first = 0
            let last = owner.count - 1
            let random = Int.random(in: first...last)
            print(random)
            owner.backTo(num: random)
            owner.count = random + 1
        }), for: .touchUpInside)
    }
}

extension FirstCoordinator {
    private func count(_ num: Int) {
        self.count += num
        print("현재:", count)
    }
}
