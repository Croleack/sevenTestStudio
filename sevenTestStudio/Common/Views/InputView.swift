//
//  InputView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI
///this type is responsible for text fields during authentication and registration
struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
	   VStack(alignment: .leading) {
		  Text(title)
			 .foregroundColor(Color(Constants.headerTextFieldColor))
			 .fontWeight(.semibold)
			 .font(.footnote)
			 .font(.system(size: Constants.titleFontSize))
			 .padding(.bottom, Constants.titleBottomPadding)
		  
		  if isSecureField {
			 SecureField(placeholder, text: $text)
				.font(.system(size: Constants.textFieldFontSize))
				.foregroundColor(Color(Constants.textFieldColor))
				.onTapGesture {
				    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
				}
		  } else {
			 TextField(placeholder, text: $text)
				.font(.system(size: Constants.textFieldFontSize))
				.foregroundColor(Color(Constants.textFieldColor))
				.onTapGesture {
				    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
				}
		  }
		  Divider()
	   }
    }
}

// MARK: - Constants

fileprivate extension InputView {
    enum Constants {
	   static let headerTextFieldColor = "headerTextField"
	   static let titleFontSize = 15.0
	   static let titleBottomPadding = 7.51
	   static let textFieldFontSize = 18.0
	   static let textFieldColor = "textField"
    }
}
