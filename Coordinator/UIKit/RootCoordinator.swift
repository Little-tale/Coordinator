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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.start()
    }
    
    func start() {
        setRoot()
    }
}

extension RootCoordinator {
    private func setRoot() {
        let root = RootViewController()
        navigationController?.setViewControllers([root], animated: true)
    }
}
