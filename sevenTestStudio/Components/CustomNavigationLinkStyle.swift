//
//  CustomNavigationLinkStyle.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 22.02.2024.
//
import SwiftUI

struct CustomNavigationLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
	   configuration.label
		  .foregroundColor(.white)
		  .frame(width: UIScreen.main.bounds.width - 38,
			    height: 47)
		  .background(configuration.isPressed ? Color.gray : Color("foregroundButton"))
		  .cornerRadius(20)
		  .padding(.top, 30.51)
    }
}
