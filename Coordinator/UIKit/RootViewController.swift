//
//  RootViewController.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/10/24.
//

import UIKit

final class RootViewController: BaseViewController<BaseView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.setLabelText("first, CoordinatorView!")
    }
    
}