//
//  LoadingView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 20.02.2024.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
	   ZStack {
		  Color(.systemBackground).edgesIgnoringSafeArea(.all)
		  ProgressView()
			 .progressViewStyle(CircularProgressViewStyle(tint: .gray))
			 .scaleEffect(2)
	   }
    }
}
