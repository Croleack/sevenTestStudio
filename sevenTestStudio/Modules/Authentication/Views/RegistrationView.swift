//
//  RegistrationView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var repeatPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
	   VStack {
		  
		  NavigationBarView(title: Constants.registrationTitle)
		  VStack(spacing: Constants.verticalSpacing) {
			 InputView(text: $email,
					 title: Constants.emailTitle,
					 placeholder: Constants.emailPlaceholder)
			 .autocapitalization(.none)
			 
			 InputView(text: $password,
					 title: Constants.passwordTitle,
					 placeholder: Constants.passwordPlaceholder,
					 isSecureField: true)
			 
			 ZStack(alignment: .trailing) {
				InputView(text: $repeatPassword,
						title: Constants.repeatPasswordTitle,
						placeholder: Constants.passwordPlaceholder,
						isSecureField: true)
				
				if !password.isEmpty && !repeatPassword.isEmpty {
				    if password == repeatPassword {
					   Image(systemName: Constants.checkmarkImage)
						  .imageScale(.large)
						  .fontWeight(.bold)
						  .foregroundColor(Color(.systemGreen))
				    } else {
					   Image(systemName: Constants.xmarkImage)
						  .imageScale(.large)
						  .fontWeight(.bold)
						  .foregroundColor(Color(.systemRed))
				    }
				}
			 }
		  }
		  .padding(.top, Constants.topPadding)
		  .padding(.horizontal, Constants.horizontalPadding)
		  
		  ButtonView(title: Constants.registerButtonTitle) {
			 viewModel.register(login: email, password: password)
		  }
		  .padding(.top, Constants.buttonTopPadding)
		  .disabled(!formIsValid)
		  .opacity(formIsValid ? 1.0 : 0.5)
		  
		  Spacer()
		  
		  Button {
			 dismiss()
		  } label: {
			 HStack {
				Text(Constants.alreadyHaveAccountText)
				Text(Constants.loginText)
				    .fontWeight(.bold)
			 }
			 .foregroundColor(Color(Constants.foregroundButtonColor))
			 .font(.system(size: Constants.buttonFontSize))
		  }
		  .padding(.bottom, Constants.buttonBottomPadding)
	   }
    }
}
//MARK: - extension RegistrationView (minimal text field validation)
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
	   return !email.isEmpty
	   && email.contains("@")
	   && !password.isEmpty
	   && password == repeatPassword
	   && password.count > 5
    }
}

// MARK: - Constants

fileprivate extension RegistrationView {
    enum Constants {
	   static let registrationTitle = "Регистрация"
	   static let emailTitle = "e-mail"
	   static let emailPlaceholder = "example@example.ru"
	   static let passwordTitle = "Пароль"
	   static let repeatPasswordTitle = "Повторите пароль"
	   static let passwordPlaceholder = "******"
	   static let checkmarkImage = "checkmark.circle.fill"
	   static let xmarkImage = "xmark.circle.fill"
	   static let registerButtonTitle = "Регистрация"
	   static let alreadyHaveAccountText = "Уже есть учетная запись"
	   static let loginText = "Войти"
	   static let foregroundButtonColor = "foregroundButton"
	   static let verticalSpacing = 24.49
	   static let topPadding = 190.0
	   static let horizontalPadding = 18.0
	   static let buttonTopPadding = 30.51
	   static let buttonFontSize = 14.0
	   static let buttonBottomPadding = 10.0
    }
}
