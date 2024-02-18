//
//  LoginView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
	   NavigationStack {
		  VStack {
			 
			 NavigationBarView(title: "Вход")
			 
			 VStack(spacing: 24.49) {
				InputView(text: $email,
						title: "e-mail",
						placeholder: "example@example.ru")
				.autocapitalization(.none)
				
				InputView(text: $password,
						title: "Пароль",
						placeholder: "******",
						isSecureField: true)
			 }
			 .padding(.horizontal, 18)
			 .padding(.top, 190)
			 
			 Button {
				viewModel.goLogin(login: email, password: password)
			 } label: {
				Text("Войти")
				    .fontWeight(.semibold)
				    .foregroundColor(Color("textButton"))
				    .frame(width: UIScreen.main.bounds.width - 38,
						 height: 47)
			 }
			 .background(Color("foregroundButton"))
			 .disabled(!formIsValid)
			 .opacity(formIsValid ? 1.0 : 0.5)
			 .cornerRadius(20)
			 .padding(.top, 30.51)
			 
			 Image(systemName: viewModel.isAuthenticated ? "lock.fill":
			 "lock.open")
			 Spacer()
			 
			 NavigationLink {
				RegistrationView()
				    .navigationBarBackButtonHidden(true)
			 } label: {
				HStack {
				    Text("Нет учетной записи?")
				    Text("Зарегистрироваться")
					   .fontWeight(.bold)
				}
				.foregroundColor(Color("foregroundButton"))
				.font(.system(size: 14))
			 }
		  }
	   }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
	   return !email.isEmpty
	   //&& email.contains("@")
	   && !password.isEmpty
	   && password.count > 5
    }
}

#Preview {
    LoginView()
}
