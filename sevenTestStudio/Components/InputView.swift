//
//  InputView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    
    var body: some View {
	   VStack(alignment: .leading) {
		  Text(title)
			 .foregroundColor(Color("headerTextField"))
			 .fontWeight(.semibold)
			 .font(.footnote)
			 .font(.system(size: 15))
			 .padding(.bottom, 7.51)
		  
		  if isSecureField {
			 SecureField(placeholder, text: $text)
				.font(.system(size: 18))
				.foregroundColor(Color("textField"))
		  } else {
			 TextField(placeholder, text: $text)
				.font(.system(size: 18))
				.foregroundColor(Color("textField"))
		  }
		  Divider()
	   }
    }
}

#Preview {
    InputView(text: .constant(""), title: "email", placeholder: "cdsnj")
}
