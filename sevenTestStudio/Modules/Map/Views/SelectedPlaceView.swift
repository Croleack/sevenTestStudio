//
//  SelectedPlaceView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 21.02.2024.
//

import SwiftUI

struct SelectedPlaceView: View {
    var placeName: String
    var address: String
    
    var body: some View {
	   VStack(alignment: .leading) {
		  Text(placeName)
			 .font(.system(size: Constants.placeNameFontSize, weight: .black))
			 .lineLimit(.zero)
		  
		  Text(address)
			 .padding(.top, Constants.addressTopPadding)
			 .padding(.bottom, Constants.addressBottomPadding)
		  
		  Button(action: {
			 
		  }) {
			 Text(Constants.routeButtonText)
				.padding(.vertical, Constants.buttonVerticalPadding)
				.frame(maxWidth: .infinity)
				.foregroundColor(.white)
				.background(Color(Constants.foregroundButtonColor))
		  }
		  .cornerRadius(Constants.buttonCornerRadius)
	   }
	   .padding(.horizontal, Constants.horizontalPadding)
	   .presentationDetents([.height(Constants.detentHeight)])
    }
}

// MARK: - Constants

fileprivate extension SelectedPlaceView {
    enum Constants {
	   static let placeNameFontSize: CGFloat = 20
	   static let addressTopPadding: CGFloat = 10
	   static let addressBottomPadding: CGFloat = 30
	   static let buttonVerticalPadding: CGFloat = 15
	   static let buttonCornerRadius: CGFloat = 20
	   static let horizontalPadding: CGFloat = 18
	   static let detentHeight: CGFloat = 200
	   static let routeButtonText = "Маршрут"
	   static let foregroundButtonColor = "foregroundButton"
	   
    }
}
