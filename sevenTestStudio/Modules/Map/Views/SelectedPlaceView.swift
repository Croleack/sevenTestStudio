//
//  SelectedPlaceView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 21.02.2024.
//

import SwiftUI

struct SelectedPlaceView: View {
    var placeName: String
    var adress: String
    
    var body: some View {
	   VStack(alignment: .leading) {
		  Text(placeName)
			 .font(.system(size: 20, weight: .black))
			 .lineLimit(.zero)
		  Text(adress)
			 .padding(.top, 10)
			 .padding(.bottom, 30)
		  
		  Button {

		  } label: {
			 Text("Маршрут")
				.padding(.vertical, 15)
				.frame(maxWidth: .infinity)
				.foregroundColor(.white)
				.background(Color("foregroundButton"))
		  }
		  .cornerRadius(20)
	   }
	   .padding(.horizontal, 18)
	   .presentationDetents([.height(200)])
    }
}


