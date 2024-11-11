//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/11/24.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    let window: UIWindow?
    
    weak var navigationController: UINavigationController?
    
    init(_ window: UIWindow?) {
        self.window = window
        window?.makeKeyAndVisible()
        start()
    }
    
    func start() {
        let tabBarController = setTabBar()
        self.window?.rootViewController = tabBarController
    }
}

extension AppCoordinator {
    private func setTabBar() -> UITabBarController {
        let tabbar = UITabBarController()
        
        let firstItem = UITabBarItem(title: "FIRST", image: nil, tag: 0)
        let secondItem = UITabBarItem(title: "SECOND", image: nil, tag: 1)
        let thirdItem = UITabBarItem(title: "THIRD", image: nil, tag: 2)
        
        let firstCoordinator = FirstCoordinator()
        let secondCoordinator = SecondCoordinator()
        let thirdCoordinator = ThirdCoordinator()
    
        self.childCoordinators.append(firstCoordinator)
        self.childCoordinators.append(secondCoordinator)
        self.childCoordinators.append(thirdCoordinator)
        
        let firstView = firstCoordinator.startGetNavigation()
        let secondView = secondCoordinator.startGetNavigation()
        let thirdView = thirdCoordinator.startGetNavigation()
        
        firstView?.tabBarItem = firstItem
        secondView?.tabBarItem = secondItem
        thirdView?.tabBarItem = thirdItem
        
        firstCoordinator.parentCoordinator = self
        secondCoordinator.parentCoordinator = self
        thirdCoordinator.parentCoordinator = self
        
        guard let firstView, let secondView, let thirdView else {
            print("문")
            return tabbar
        }
        
        tabbar.viewControllers = [firstView, secondView, thirdView]
        
        return tabbar
    }
}
