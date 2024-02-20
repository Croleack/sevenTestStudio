//
//  ParameterEncoding.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//
import Foundation

public typealias Parameters = [String: Any]

protocol ParameterEncoding {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
