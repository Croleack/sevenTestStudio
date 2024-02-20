//
//  MenuView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 18.02.2024.
//

import SwiftUI

struct CafeDetailView: View {
    var id: Int
    @ObservedObject var cafesVM: CafesViewModel
    
    var body: some View {
	   NavigationStack {
		  ScrollView {
				ForEach($cafesVM.order) { coffee in
				    CoffeeCellView(coffee: coffee)
				}
			 .navigationTitle("Меню")
		  }
		  NavigationLink {
			 OrderView(cafesVM: cafesVM)
				.navigationBarBackButtonHidden(true)
		  } label: {
			 Text("Перейти к оплате")
		  }
		  .buttonStyle(.borderedProminent)
		  .padding()
	   }
	   .onAppear {
		  cafesVM.loadCafe(id: id)
	   }
	   .refreshable {
		  cafesVM.loadCafe(id: id)
	   }
    }
}
