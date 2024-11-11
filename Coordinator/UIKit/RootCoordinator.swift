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
            nextView.baseView.setLabelText(String(owner.count))
            owner.setRootAction(root: nextView)
        }), for: .touchUpInside)
        
        root.baseView.backButton.addAction(UIAction.guardSelf(self, handler: { owner, action in
            owner.back(animated: true)
        }),for: .touchUpInside)
        
        root.baseView.nextCoordinatorButton.addAction(UIAction.guardSelf(self, handler: { owner, action in
            let nextNavigationController = UINavigationController()
            let nextCoordinator = SubCoordinator(navigationController: nextNavigationController)
            nextCoordinator.backDelegate = owner
            owner.childCoordinators.append(nextCoordinator)
            
            nextNavigationController.modalPresentationStyle = .fullScreen
            owner.present(viewController: nextNavigationController, animated: false)
        }), for: .touchUpInside)
        
        
        root.baseView.backCoordinatorButton.addAction(UIAction.guardSelf(self, handler: { owner, action in
            print(owner.childCoordinators)
            if !owner.childCoordinators.isEmpty {
                owner.dismiss(animated: true)
                owner.childCoordinators.removeLast()
            }
        }), for: .touchUpInside)
    }
    
    private func counting(num: Int) {
        count += num
    }
}

extension RootCoordinator: BackCoordinatorDelegate {
    
    func backCoordinatorDidFinish(_ coordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter{ $0 !== coordinator }
        dismiss(animated: false)
    }
}
