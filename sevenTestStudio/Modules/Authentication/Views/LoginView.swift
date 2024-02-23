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
			 
			 NavigationBarView(title: Constants.loginTitle)
			 
			 VStack(spacing: Constants.verticalSpacing) {
				InputView(text: $email,
						title: Constants.emailTitle,
						placeholder: Constants.emailPlaceholder)
				.autocapitalization(.none)
				
				InputView(text: $password,
						title: Constants.passwordTitle,
						placeholder: Constants.passwordPlaceholder,
						isSecureField: true)
			 }
			 .padding(.horizontal, Constants.horizontalPadding)
			 .padding(.top, Constants.topPadding)
			 
			 ButtonView(title: Constants.loginButtonTitle) {
				viewModel.login(login: email, password: password)
			 }
			 .padding(.top, Constants.buttonTopPadding)
			 .disabled(!formIsValid)
			 .opacity(formIsValid ? 1.0 : 0.5)
			 
			 Spacer()
			 
			 NavigationLink {
				RegistrationView()
				    .navigationBarBackButtonHidden(true)
			 } label: {
				HStack {
				    Text(Constants.noAccountText)
				    Text(Constants.registerText)
					   .fontWeight(.bold)
				}
				.foregroundColor(Color(Constants.foregroundButtonColor))
				.font(.system(size: Constants.buttonFontSize))
			 }
			 .padding(.bottom, Constants.buttonBottomPadding)
		  }
	   }
    }
}
//MARK: - extension LoginView (minimal text field validation)
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
	   return !email.isEmpty
	   && email.contains("@")
	   && !password.isEmpty
	   && password.count > 5
    }
}

// MARK: - Constants

fileprivate extension LoginView {
    enum Constants {
	   static let loginTitle = "Вход"
	   static let emailTitle = "e-mail"
	   static let emailPlaceholder = "example@example.ru"
	   static let passwordTitle = "Пароль"
	   static let passwordPlaceholder = "******"
	   static let loginButtonTitle = "Войти"
	   static let noAccountText = "Нет учетной записи?"
	   static let registerText = "Зарегистрироваться"
	   static let foregroundButtonColor = "foregroundButton"
	   static let verticalSpacing = 24.49
	   static let horizontalPadding = 18.0
	   static let topPadding = 190.0
	   static let buttonTopPadding = 30.51
	   static let buttonFontSize = 14.0
	   static let buttonBottomPadding = 10.0
    }
}
