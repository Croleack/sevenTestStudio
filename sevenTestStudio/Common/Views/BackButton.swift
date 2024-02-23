//
//  BackButton.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 20.02.2024.
//

import SwiftUI

///navigation model
struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    let text: String
    
    var body: some View {
	   VStack {
		  HStack {
			 Button(action: {
				self.presentationMode.wrappedValue.dismiss()
			 }) {
				Image(Constants.navigImage)
				    .frame(width: Constants.frameImageWidth,
						 height: Constants.frameImageHeight
				    )
				    .padding(.leading, Constants.paddingArrow)
			 }
			 Spacer()
			 Text(text)
				.foregroundColor(Color(Constants.textForeground))
				.font(.system(size: Constants.fontText,
						    weight: .semibold))
				.frame(alignment: .center)
				.lineLimit(nil)
				.multilineTextAlignment(.center)
			 Spacer()
		  }
		  .frame(alignment: .center)
		  Divider()
			 .background(Color(Constants.dividerForeground))
			 .frame(width: UIScreen.main.bounds.width,
				   height: Constants.heightDividerOne)
		  Divider()
			 .background(Color(Constants.dividerForeground))
			 .frame(width: UIScreen.main.bounds.width,
				   height: Constants.heightDividerTwo)
			 .padding(.bottom, Constants.paddingBotDivid)
	   }
	   .padding(.top, Constants.paddingTopVStack)
    }
}

// MARK: - Constants

fileprivate extension BackButton {
    enum Constants {
	   
	   static let navigImage = "ic-navig"
	   static let textForeground = "navigationTitle"
	   static let dividerForeground = "navStrip"
	   static let fontText = 18.0
	   static let frameImageHeight = 12.0
	   static let frameImageWidth = 7.41
	   static let heightDividerOne = 2.0
	   static let heightDividerTwo = 1.0
	   static let paddingArrow = 28.0
	   static let paddingBotDivid = 15.0
	   static let paddingTopVStack = 15.0
    }
}
