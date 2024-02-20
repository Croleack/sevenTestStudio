//
//  NetworkManager.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import Foundation

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

class NetworkManager {
    let router = Router<SevenWindsStudioApi>()

    fileprivate func processResponse<T: Decodable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        completion: @escaping (_ success: T?, _ error: String?) -> Void
    ) {
        if let error = error {
            completion(nil, "Please check your network connection. \(error.localizedDescription)")
            return
        }

        guard let response = response as? HTTPURLResponse else {
            completion(nil, NetworkResponse.failed.rawValue)
            return
        }

        let result = handleNetworkResponse(response)

        switch result {
        case .success:
            guard let responseData = data else {
                completion(nil, NetworkResponse.noData.rawValue)
                return
            }

            do {
                let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                print(apiResponse)
                completion(apiResponse, nil)
            } catch let error {
                print("Error in decode for: \(T.self)\nError: \(error)")
                completion(nil, NetworkResponse.unableToDecode.rawValue)
            }
        case .failure(let networkFailureError):
            completion(nil, networkFailureError)
        }
    }

    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 400: return .failure(NetworkResponse.badRequest.rawValue)
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }

    func auth(
        login: String,
        password: String,
        completion: @escaping (_ success: LoginResponse?, _ error: String?) -> Void
    ) {
        router.request(.auth(login: login, password: password)) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }

    func register(
        login: String,
        password: String,
        completion: @escaping (_ success: LoginResponse?, _ error: String?) -> Void
    ) {
        router.request(.register(login: login, password: password)) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }

    func loadCafes(
        completion: @escaping (_ success: [ShortCafeResponse]?, _ error: String?) -> Void
    ) {
        router.request(.loadCafes) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }

    func loadCafe(
        id: Int,
        completion: @escaping (_ success: CafeResponse?, _ error: String?) -> Void
    ) {
        router.request(.loadCafe(id: id)) { data, response, error in
            self.processResponse(data: data, response: response, error: error, completion: completion)
        }
    }
}
