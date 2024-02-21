//
//  CafeListView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import SwiftUI
import CoreLocation
    

struct CafeListView: View {
    @ObservedObject var cafesVM: CafesViewModel
    @ObservedObject var locationViewModel: LocationManagerViewModel
    @State private var currentLocation: CLLocationCoordinate2D? = nil
    @State private var isLoading = false
    @State private var isMapButtonTapped = false
    
    var body: some View {
	   NavigationView {
		  VStack {
			 ScrollView {
				ForEach(cafesVM.cafes) { cafe in
				    NavigationLink(
					   destination: CafeDetailView(id: cafe.id, cafesVM: cafesVM)
						  .navigationBarBackButtonHidden(true),
					   
					   label: {
						  VStack {
							 Text(cafe.name)
								.fontWeight(.semibold)
								.foregroundColor(Color("headerTextField"))
							 if let currentLocation = locationViewModel.currentLocation {
								Text(cafe.distance(to: currentLocation))
								    .font(.subheadline)
								    .foregroundColor(Color("textField"))
							 }
						  }
					   }
				    )
				    .frame(width: UIScreen.main.bounds.width - 26,
						 height: 71)
				    .background(Color("foregroundCell"))
				    .cornerRadius(5)
				    .listRowInsets(EdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0))
				}	
			 }
			 ButtonView(title: "К Карте") {
				isMapButtonTapped = true
			 }
			 NavigationLink(
				destination: LocationView()
				    .navigationBarHidden(true),
				isActive: $isMapButtonTapped,
				label: { EmptyView() }
			 )
			 .hidden()
		  }
		  .toolbar {
			 ToolbarItem(placement: .navigationBarLeading) {
				BackButton(text: "Ближайшие кофейни")
			 }
		  }
	   }
	   .onAppear {
		  if isLoading { LoadingView() }
		  cafesVM.loadCafes()
		  locationViewModel.checkLocationIsEnabled()
	   }
	   .refreshable {
		  cafesVM.loadCafes()
	   }
    }
}
