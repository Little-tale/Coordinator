//
//  ThirdCoordinator.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/11/24.
//

import UIKit

final class ThirdCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    private var count: Int = 0
    
    var navigationController: UINavigationController?
    
    init() {
        start()
    }
    
    func start() {
        navigationController = UINavigationController()
    }
    
    func startGetNavigation() -> UINavigationController? {
        let third = RandomViewController()
        navigationController?.setViewControllers([third], animated: true)
        count(1)
        third.baseView.setLabelText(String(count) + " 번째 화면")
        setAction(third)
        return navigationController
    }
}

extension ThirdCoordinator {
    private func count(_ num: Int) {
        self.count += num
    }
    
    func setAction(_ view: RandomViewController) {
        view.baseView.nextButton.addAction(UIAction.guardSelf(self, handler: { owner, _ in
            let next = RandomViewController()
            owner.next(viewController: next)
            owner.count(1)
            next.baseView.setLabelText(String(owner.count) + " 번째 화면")
            owner.setAction(next)
        }), for: .touchUpInside)
        
        
        view.baseView.backButton.addAction(UIAction.guardSelf(self, handler: { owner, _ in
            owner.count(-1)
            owner.back(animated: true)
        }),for: .touchUpInside)
        
        view.baseView.rootPopButton.addAction(UIAction.guardSelf(self, handler: { owner, _ in
            owner.count(-(owner.count - 1))
            owner.rootPop()
        }), for: .touchUpInside)
    }
}
