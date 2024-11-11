//
//  SubCoordinator.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/10/24.
//

import UIKit

final class SubCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController?
    
    weak var backDelegate: BackCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        start()
    }
    
    func start() {
        let nextView = SubViewController()
        navigationController?.setViewControllers([nextView], animated: true)
        
        viewAction(nextView)
    }
}

extension SubCoordinator {
    private func viewAction(_ view: SubViewController) {
        view.baseView.backCoordinatorButton.addAction(UIAction.guardSelf(self, handler: { owner, _ in
            owner.backDelegate?.backCoordinatorDidFinish(owner)
        }), for: .touchUpInside)
    }
}

