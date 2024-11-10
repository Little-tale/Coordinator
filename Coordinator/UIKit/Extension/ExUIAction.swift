//
//  ExUIAction.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/10/24.
//

import UIKit

extension UIAction {
    static func guardSelf<Object: AnyObject>(_ object: Object, handler: @escaping (Object, UIAction) -> Void) -> UIAction {
        return UIAction { [weak object] action in
            guard let object else { print("action DELETED") ; return }
            handler(object, action)
        }
    }
}
