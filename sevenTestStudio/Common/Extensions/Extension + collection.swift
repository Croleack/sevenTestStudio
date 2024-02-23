//
//  Extension + collection.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 23.02.2024.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
	   return indices.contains(index) ? self[index] : nil
    }
}
