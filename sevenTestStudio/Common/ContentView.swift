//
//  ContentView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 17.02.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var cafesVM:CafesViewModel? = nil
    
    var body: some View {
	   Group {
		  if viewModel.isAuthenticated {
			 if let cafesVM = cafesVM {
				CafeListView(cafesVM: cafesVM)
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
