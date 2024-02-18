//
//  WebService.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 18.02.2024.
//

import Foundation

enum AuthenticationError: Error {
    case invalidUser
    case custom(errorMessage: String)
}

enum NetworkErrorr: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Codable {
    let login: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String?
    let tokenLifetime: Int?
    let success: Bool?
}



class WebService {
    
    func getAllLocat(token: String, completion: @escaping (Result<[LocationResponse], NetworkErrorr>) -> Void) {
	   
	   guard let url = URL(string: "http://147.78.66.203:3210/locations") else {
		  completion(.failure(.invalidURL))
		  return
	   }
	   
	   var request = URLRequest(url: url)
	   request.httpMethod = "GET"
	   request.addValue("Bearer \(String(describing: UserDefaults.standard.string(forKey: "token")))",
					forHTTPHeaderField: "Authorization")
	   
	   URLSession.shared.dataTask(with: request) { data, response, error in
		  
		  guard let data = data, error == nil else {
			 completion(.failure(.noData))
			 return
		  }
		  
		  guard let locations = try? JSONDecoder().decode([LocationResponse].self, from: data) else {
			 completion(.failure(.decodingError))
			 return
		  }
		  
		  completion(.success(locations))
	   }
	   .resume()
    }
    
    func login(login: String,
			password: String,
			completion: @escaping (Result<String, AuthenticationError>) -> Void) {
	   guard let url = URL(string: "http://147.78.66.203:3210/auth/login") else {
		  completion(.failure(.custom(errorMessage: "URL is not corrected")))
		  return
	   }
	   print("URL запроса:", url)
	   
	   let body = LoginRequestBody(login: login, password: password)
	   
	   var request = URLRequest(url: url)
	   request.httpMethod = "POST"
	   request.addValue("application/json", forHTTPHeaderField: "Content-Type")
	   request.httpBody = try? JSONEncoder().encode(body)
	   
		  URLSession.shared.dataTask(with: request) { data, response, error in
			 guard let data = data, error == nil else {
				completion(.failure(.custom(errorMessage: "No data")))
				return
			 }
			 
			 guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
				completion(.failure(.invalidUser))
				return
			 }
			 
			 guard let token = loginResponse.token else {
				completion(.failure(.invalidUser))
				return
			 }
			 
			 completion(.success(token))
		  }
		  .resume()
    }
    
    func register(login: String,
			password: String,
			completion: @escaping (Result<String, AuthenticationError>) -> Void) {
	   guard let url = URL(string: "http://147.78.66.203:3210/auth/register") else {
		  completion(.failure(.custom(errorMessage: "URL is not corrected")))
		  return
	   }
	   print("URL запроса:", url)
	   
	   let body = LoginRequestBody(login: login, password: password)
	   
	   var request = URLRequest(url: url)
	   request.httpMethod = "POST"
	   request.addValue("application/json", forHTTPHeaderField: "Content-Type")
	   request.httpBody = try? JSONEncoder().encode(body)
	   
	   URLSession.shared.dataTask(with: request) { data, response, error in
		  guard let data = data, error == nil else {
			 completion(.failure(.custom(errorMessage: "No data")))
			 return
		  }
		  
		  guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
			 completion(.failure(.invalidUser))
			 return
		  }
		  
		  guard let token = loginResponse.token else {
			 completion(.failure(.invalidUser))
			 return
		  }
		  
		  completion(.success(token))
	   }
	   .resume()
    }
}
