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
    @ObservedObject var locationViewModel: LocationViewModel
    @State private var currentLocation: CLLocationCoordinate2D? = nil
    @State private var isLoading = false
    @State private var isMapButtonTapped = false
    
    var body: some View {
	   NavigationStack {
		  VStack {
			 NavigationBarView(title: Constants.navigationBarTitle)
			 ScrollView {
				ForEach(cafesVM.cafes) { cafe in
				    NavigationLink(
					   destination: CafeDetailView(id: cafe.id, cafesVM: cafesVM)
						  .navigationBarBackButtonHidden(true),
					   label: {
						  VStack(spacing: Constants.verticalSpacing) {
							 HStack {
								Text(cafe.name)
								    .bold()
								    .font(.title2)
								    .foregroundColor(Color(Constants.headerTextFieldColor))
								Spacer()
							 }
							 .padding(.leading, Constants.leadingPadding)
							 HStack {
								if let currentLocation = locationViewModel.currentLocation {
								    Text(cafe.distance(to: currentLocation))
									   .font(.subheadline)
									   .foregroundColor(Color(Constants.textFieldColor))
								}
								Spacer()
							 }
							 .padding(.leading, Constants.leadingPadding)
						  }
						  .frame(width: UIScreen.main.bounds.width - Constants.frameWidth,
							    height: Constants.rowHeight)
						  .background(Color(Constants.cellBackgroundColor))
						  .cornerRadius(Constants.cornerRadius)
					   }
				    )
				}
			 }
			 NavigationLink {
				LocationView()
				    .navigationBarBackButtonHidden(true)
			 } label: {
				Text(Constants.mapButtonText)
			 }
			 .padding(.bottom, Constants.bottomPadding)
			 .buttonStyle(CustomNavigationLinkStyle())
		  }
	   }
	   .onAppear {
		  cafesVM.loadCafes()
		  locationViewModel.checkLocationIsEnabled()
	   }
	   .overlay(
		  Group {
			 if isLoading {
				LoadingView()
			 }
		  }
	   )
	   .refreshable {
		  cafesVM.loadCafes()
	   }
    }
}

// MARK: - Constants

fileprivate extension CafeListView {
    enum Constants {
	   static let navigationBarTitle = "Ближайшие кафе"
	   static let headerTextFieldColor = "headerTextField"
	   static let textFieldColor = "textField"
	   static let cellBackgroundColor = "foregroundCell"
	   static let mapButtonText = "На карте"
	   static let verticalSpacing = 6.0
	   static let leadingPadding = 10.0
	   static let frameWidth = 26.0
	   static let cornerRadius = 5.0
	   static let rowHeight = 71.0
	   static let bottomPadding = 32.49
	   
    }
}
