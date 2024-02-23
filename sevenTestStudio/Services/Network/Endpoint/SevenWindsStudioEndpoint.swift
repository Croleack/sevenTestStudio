//
//  SevenWindsStudioApi.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import Foundation

public enum SevenWindsStudioApi {
    case auth(login: String, password: String)
    case loadCafes
    case loadCafe(id: Int)
    case register(login: String, password: String)
}

extension SevenWindsStudioApi: EndpointType {
    var baseURL: URL {
	   guard let url = URL(string: "http://147.78.66.203:3210/")
	   else { fatalError("baseURL could not be configured.")}
	   return url
    }

    var path: String {
        switch self {
        case .auth: return "auth/login"
        case .register: return "auth/register"
        case .loadCafes: return "locations"
        case .loadCafe(let id): return "location/\(id)/menu"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .auth, .register: return .post
        default: return .get
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .auth, .register:
            return nil
        default:
            return [
                "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token") ?? "")",
            ]
        }
    }

    var body: Parameters? {
        switch self {
        case .auth(let login, let password), .register(let login, let password): return [
            "login": login,
            "password": password
        ]
        default: return nil
        }
    }

    var task: HTTPTask {
         return .requestParametersAndHeaders(
            bodyParameters: body,
            urlParameters: urlParameters,
            additionHeaders: headers
        )
    }
}

extension SevenWindsStudioApi {
    var urlParameters: Parameters? {
        switch self {
        default: return [:]
        }
    }
}
