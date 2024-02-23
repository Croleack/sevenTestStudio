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
			 .foregroundColor(Color(Constants.navigationTitleColor))
			 .font(.system(size: Constants.titleFontSize, weight: .semibold))
		  
		  Divider()
			 .background(Color(Constants.navStripColor))
			 .frame(height: Constants.dividerHeight)
		  
		  Divider()
			 .background(Color(Constants.navStripColor))
			 .frame(height: Constants.dividerHeight)
	   }
    }
}

// MARK: - Constants

fileprivate extension NavigationBarView {
    enum Constants {
	   static let navigationTitleColor = "navigationTitle"
	   static let titleFontSize = 18.0
	   static let navStripColor = "navStrip"
	   static let dividerHeight = 2.0
    }
}
