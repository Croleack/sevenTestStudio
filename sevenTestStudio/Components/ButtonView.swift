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
			 .foregroundColor(Color("textButton"))
			 .frame(width: UIScreen.main.bounds.width - 38,
				   height: 47)
	   }
	   .background(Color("foregroundButton"))
	   .cornerRadius(20)
	   .padding(.top, 30.51)
    }
}
