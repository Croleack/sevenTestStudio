//
//  ShortCafeResponse.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import Foundation

struct ShortCafeResponse: Codable {
    let id: Int?
    let name: String?
    let point: PointResponse?
}

struct PointResponse: Codable {
    let latitude, longitude: String?
}
