//
//  ContentView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI

///depending on whether the user is authenticated, LoginView or CafeListView will be shown
struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var cafesVM: CafesViewModel? = nil
    @State private var locationViewModel = LocationViewModel()
    
    var body: some View {
	   Group {
		  if viewModel.isAuthenticated {
			 if let cafesVM = cafesVM {
				CafeListView(cafesVM: cafesVM, locationViewModel: locationViewModel)
			 } else {
				ProgressView()
				    .onAppear {
					   cafesVM = CafesViewModel()
				    }
			 }
		  }
		  else {
			 LoginView()
		  }
	   }
	   .onAppear {
		  if viewModel.isAuthenticated {
			 cafesVM = CafesViewModel()
		  }
	   }
    }
}
