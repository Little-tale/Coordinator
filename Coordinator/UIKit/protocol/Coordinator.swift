//
//  Coordinator.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/10/24.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get }
    func start()
}

extension Coordinator {
    /// 다음 화면으로 이동
    func next(viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    /// 뒤로 이동
    func back(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    /// 루트로 이동
    func rootPop(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    /// 모달로 화면을 표시
    func present(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.present(viewController, animated: animated, completion: completion)
    }
    
    /// 현재 모달을 닫음
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController?.dismiss(animated: animated, completion: completion)
    }
}
