//
//  BackCoordinatorDelegate.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/11/24.
//

import Foundation

protocol BackCoordinatorDelegate: AnyObject {
    func backCoordinatorDidFinish(_ coordinator: Coordinator)
}
