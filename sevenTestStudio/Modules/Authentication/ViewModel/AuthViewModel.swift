//
//  AuthViewModel.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import Foundation
import SwiftUI

protocol AuthenticationFormProtocol {
    var formIsValid: Bool {get}
}

class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    private let networkManager = NetworkManager()
    
    func saveToken(token: String, lifetime: Int) {
	   let currentDate = Date()
	   let expirationDate = currentDate.addingTimeInterval(TimeInterval(lifetime))
	   
	   UserDefaults.standard.setValue(token, forKey: "token")
	   UserDefaults.standard.set(expirationDate, forKey: "expirationDate")
    }
    
    func login(login: String, password: String) {
	   networkManager.auth(login: login, password: password) { success, error in
		  if let error = error {
			 print(error)
			 return
		  }
		  
		  if let token = success?.token, let tokenLifetime = success?.tokenLifetime {
			 self.saveToken(token: token, lifetime: tokenLifetime)
			 
			 DispatchQueue.main.async {
				self.isAuthenticated = true
			 }
		  }
	   }
    }
    
    func register(login: String, password: String) {
	   networkManager.register(login: login, password: password) { success, error in
		  if let error = error {
			 print(error)
			 return
		  }
		  
		  if let token = success?.token, let tokenLifetime = success?.tokenLifetime {
			 self.saveToken(token: token, lifetime: tokenLifetime)
			 
			 DispatchQueue.main.async {
				self.isAuthenticated = true
			 }
		  }
	   }
    }
    func hideKeyboard() {
	   UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
