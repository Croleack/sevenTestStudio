//
//  CoffeeResponse.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import Foundation

struct CoffeeResponse: Codable {
    let id: Int?
    let name, imageURL: String?
    let price: Int?
}

typealias CafeResponse = [CoffeeResponse]
