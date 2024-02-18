//
//  NavigationBarView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI

struct NavigationBarView: View {
    let title: String
    
    var body: some View {
	   VStack {
		  Text(title)
			 .foregroundColor(Color("navigationTitle"))
			 .font(.system(size: 18, weight: .semibold))
		  Divider()
			 .background(Color("navStrip"))
			 .frame(height: 2)
		  Divider()
			 .background(Color("navStrip"))
			 .frame(height: 1)
	   }
    }
}
