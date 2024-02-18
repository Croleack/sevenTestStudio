//
//  AuthViewModel.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import Foundation

protocol AuthenticationFormProtocol {
    var formIsValid: Bool {get}
}

class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated: Bool = false
    
    func goLogin(login: String, password: String) {
	   
	   let defaults = UserDefaults.standard
	   
	   WebService().login(login: login,
					  password: password) { result in
		  switch result {
		  case .success(let token):
			 defaults.setValue(token, forKey: "token")
			 DispatchQueue.main.async {
				self.isAuthenticated = true
			 }
			 
		  case .failure(let error):
			 print(error.localizedDescription)
		  }
	   }
    }
    
    func goRegis(login: String, password: String) {
	   let defaults = UserDefaults.standard
	   
	   WebService().register(login: login,
						password: password) { result in
		  switch result {
		  case .success(let token):
			 defaults.setValue(token, forKey: "token")
			 DispatchQueue.main.async {
				self.isAuthenticated = true
			 }
			 
		  case .failure(let error):
			 print(error.localizedDescription)
		  }
	   }
    }
    
    func signout() {
	   let defaults = UserDefaults.standard
	   defaults.removeObject(forKey: "token")
	   DispatchQueue.main.async {
		  self.isAuthenticated = false
	   }
    }
}
