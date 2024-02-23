//
//  CustomNavigationLinkStyle.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 22.02.2024.
//
import SwiftUI
///where NavigationLink was used I inserted this wonderful style
struct CustomNavigationLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
	   configuration.label
		  .fontWeight(.semibold)
		  .foregroundColor(Color(Constants.textButtonColor))
		  .frame(width: UIScreen.main.bounds.width - Constants.buttonHorizontalPadding,
			    height: Constants.buttonHeight)
		  .background(configuration.isPressed ? Color.gray : Color(Constants.foregroundButtonColor))
		  .cornerRadius(Constants.buttonCornerRadius)
		  .padding(.top, Constants.topPadding)
    }
}

// MARK: - Constants

fileprivate extension CustomNavigationLinkStyle {
    enum Constants {
	   static let textButtonColor = "textButton"
	   static let foregroundButtonColor = "foregroundButton"
	   static let buttonHorizontalPadding = 38.0
	   static let buttonHeight = 47.0
	   static let buttonCornerRadius = 20.0
	   static let topPadding = 30.51
    }
}
