//
//  LoginResponse.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import Foundation

struct LoginResponse: Codable {
    var token: String?
    var tokenLifetime: Int?
}
