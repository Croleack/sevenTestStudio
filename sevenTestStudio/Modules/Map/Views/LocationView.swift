//
//  LocationView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 21.02.2024.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @ObservedObject var locationViewModel = LocationViewModel()
    @State var isShowDetails = false    
    
    init() {
	   locationViewModel.checkLocationIsEnabled()
	   locationViewModel.loadCafes()
    }
    
    var body: some View {
	   NavigationStack {
		  VStack {
			 Map(coordinateRegion: $locationViewModel.region,
				showsUserLocation: true,
				annotationItems: locationViewModel.places) { place in
				MapAnnotation(coordinate: place.coordinate) {
				    VStack {
					   ZStack {
						  Circle()
							 .foregroundColor(Color(Constants.circleColor))
							 .frame(width: Constants.circleWidth,
								   height: Constants.circleHeight)
						  Image(Constants.coffeeImage)
							 .resizable()
							 .frame(width: Constants.coffeeImageWidth,
								   height: Constants.coffeeImageHeight)
					   }
					   Text(place.name)
						  .font(.system(size: Constants.placeNameFontSize))
				    }
				    .onTapGesture {
					   locationViewModel.selectedPlace(for: place)
					   isShowDetails.toggle()
				    }
				}
			 }
				.ignoresSafeArea(.container, edges: .bottom)
				.sheet(isPresented: $isShowDetails) {
				    SelectedPlaceView(placeName: locationViewModel.selectedPlaceName,
								  address: locationViewModel.selectedPlaceAdress)
				}
				.searchable(text: $locationViewModel.serachTerm)
				.onSubmit(of: .search) {
				    locationViewModel.serch() 
				}
		  }
		  .toolbar {
			 ToolbarItem(placement: .navigationBarLeading) {
				BackButton(text: Constants.backButtonText)
			 }
		  }
	   }
    }
}

// MARK: - Constants

fileprivate extension LocationView {
    enum Constants {
	   static let circleColor = "foregroundButton"
	   static let coffeeImage = "ic-coffee"
	   static let backButtonText = "Карта"
	   static let circleWidth: CGFloat = 58
	   static let circleHeight: CGFloat = 58
	   static let coffeeImageWidth: CGFloat = 30
	   static let coffeeImageHeight: CGFloat = 30
	   static let placeNameFontSize: CGFloat = 12
	   
    }
}
