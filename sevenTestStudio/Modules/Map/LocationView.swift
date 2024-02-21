//
//  LocationView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 21.02.2024.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @ObservedObject var locationViewModel = LocationManagerViewModel()
    @State var isShowDetails = false
    
    
    init() {
	   locationViewModel.checkLocationIsEnabled()
	   locationViewModel.loadCafes()
    }
    
    var body: some View {
	   NavigationStack {
		  Map(coordinateRegion: $locationViewModel.region,
			 showsUserLocation: true,
			 annotationItems: locationViewModel.places) { place in
			 MapAnnotation(coordinate: place.coordinate) {
				VStack {
				    ZStack {
					   Circle()
						  .foregroundColor(Color("foregroundButton"))
						  .frame(width: 58, height: 58)
					   Image("ic-coffee")
						  .resizable()
						  .frame(width: 30, height: 30)
				    }
				    Text(place.name)
					   .font(.system(size: 12))
				}
				.onTapGesture {
				    locationViewModel.selectedPlace(for: place)
				    isShowDetails.toggle()
				}
			 }
		  }
			 .ignoresSafeArea()
			 .sheet(isPresented: $isShowDetails) {
				SelectedPlaceView(placeName: locationViewModel.selectedPlaceName,
							   adress: locationViewModel.selectedPlaceAdress)
			 }
	   }
	   .searchable(text: $locationViewModel.serachTerm)
	   .onSubmit(of: .search) {
		  locationViewModel.serch()
		  
	   }
    }
}

