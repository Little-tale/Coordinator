//
//  ExCollection.swift
//  Coordinator
//
//  Created by Jae hyung Kim on 11/11/24.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
