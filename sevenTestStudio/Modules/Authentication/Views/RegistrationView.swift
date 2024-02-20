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
		  
		  NavigationBarView(title: "Регистрация")
		  VStack(spacing: 24.49) {
			 InputView(text: $email,
					 title: "e-mail",
					 placeholder: "example@example.ru")
			 .autocapitalization(.none)
			 
			 InputView(text: $password,
					 title: "Пароль",
					 placeholder: "******",
					 isSecureField: true)
			 
			 ZStack(alignment: .trailing) {
				InputView(text: $repeatPassword,
						title: "Повторите пароль",
						placeholder: "******",
						isSecureField: true)
				
				if !password.isEmpty && !repeatPassword.isEmpty {
				    if password == repeatPassword {
					   Image(systemName: "checkmark.circle.fill")
						  .imageScale(.large)
						  .fontWeight(.bold)
						  .foregroundColor(Color(.systemGreen))
				    } else {
					   Image(systemName: "xmark.circle.fill")
						  .imageScale(.large)
						  .fontWeight(.bold)
						  .foregroundColor(Color(.systemRed))
				    }
				}
			 }
			 
			 
		  }
		  .padding(.top, 190)
		  .padding(.horizontal, 18)
		  
		  Button {
			 viewModel.register(login: email, password: password)
		  } label: {
			 Text("Зарегистрироваться")
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
		  
		  Button {
			 dismiss()
		  } label: {
			 HStack {
				Text("Уже есть учетная запись")
				Text("Войти")
				    .fontWeight(.bold)
			 }
			 .foregroundColor(Color("foregroundButton"))
			 .font(.system(size: 14))
		  }
		  
	   }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
	   return !email.isEmpty
	   && email.contains("@")
	   && !password.isEmpty
	   && password == repeatPassword
	   && password.count > 5
    }
}

#Preview {
    RegistrationView()
}

