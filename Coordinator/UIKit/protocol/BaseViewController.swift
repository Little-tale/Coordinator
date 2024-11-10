//
//  BaseViewController.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/10/24.
//

import UIKit

class BaseViewController<V: UIView>: UIViewController {
    
    let baseView = V()
    
    override func loadView() {
        view = baseView
    }
}

