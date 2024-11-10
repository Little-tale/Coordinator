//
//  RootCoordinator.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/10/24.
//

import UIKit

final class RootCoordinator: Coordinator {
    
    var navigationController: UINavigationController?

    var childCoordinators: [Coordinator] = []
    
    private var count = 0
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.start()
    }
    
    func start() {
        setRoot()
    }
    
    deinit {
        print("deinit")
    }
}

extension RootCoordinator {
    private func setRoot() {
        let root = RootViewController()
        counting(num: 1)
        root.baseView.setLabelText(String(count))
        setRootAction(root: root)
        navigationController?.setViewControllers([root], animated: true)
    }
    
    private func setRootAction(root: RootViewController) {
        root.baseView.nextButton.addAction(UIAction.guardSelf(self, handler: { owner, action in
            print("ase")
            let nextView = RootViewController()
            owner.next(viewController: nextView)
            owner.counting(num: 1)
            nextView.baseView.setLabelText(String(owner.count))
            owner.setRootAction(root: nextView)
        }), for: .touchUpInside)
        
    }
    private func counting(num: Int) {
        count += num
    }
}
