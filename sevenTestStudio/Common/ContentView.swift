//
//  ContentView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
	   Group {
		  if viewModel.isAuthenticated {
			 LocationView()
		  } else {
			 LoginView()
		  }
	   }
    }
}

#Preview {
    ContentView()
}
