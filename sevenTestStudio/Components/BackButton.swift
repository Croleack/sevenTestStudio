//
//  BackButton.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 20.02.2024.
//

import SwiftUI

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
				    .padding(.leading, 28)
			 }
			 Spacer()
			 Text(text)
				.foregroundColor(Color("navigationTitle"))
				.lineLimit(nil)
			 Spacer()
		  }
		  Divider()
			 .background(Color("navStrip"))
			 .frame(width: UIScreen.main.bounds.width,
				   height: 2)
		  Divider()
			 .background(Color("navStrip"))
			 .frame(width: UIScreen.main.bounds.width,
				   height: 1)
		  
	   }
	   .padding(.top, 15)
	   .padding(.bottom, 15)
	   
    }
}

// MARK: - Constants

fileprivate extension BackButton {
    enum Constants {
	   
	   static let navigImage = "ic-navig"
	   static let fontText = 18.0
	   static let frameImageHeight = 12.0
	   static let frameImageWidth = 7.41
	   static let frameTextHeight = 50.0
	   static let frameTextWidth = 300.0
    }
}
