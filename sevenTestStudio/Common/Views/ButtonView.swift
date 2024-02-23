//
//  ButtonView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 20.02.2024.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
	   Button(action: action) {
		  Text(title)
			 .fontWeight(.semibold)
			 .foregroundColor(Color(Constants.textButtonColor))
			 .frame(width: UIScreen.main.bounds.width - Constants.buttonHorizontalPadding,
				   height: Constants.buttonHeight)
	   }
	   .background(Color(Constants.buttonBackgroundColor))
	   .cornerRadius(Constants.buttonCornerRadius)
    }
}

// MARK: - Constants

fileprivate extension ButtonView {
    enum Constants {
	   static let textButtonColor = "textButton"
	   static let buttonBackgroundColor = "foregroundButton"
	   static let buttonHorizontalPadding = 38.0
	   static let buttonHeight = 47.0
	   static let buttonCornerRadius = 20.0
    }
}
