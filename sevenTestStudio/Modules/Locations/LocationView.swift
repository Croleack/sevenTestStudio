//
//  MenuView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 18.02.2024.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var locationViewModel: LocationViewModel
    @State private var currentLocation: CurrentLocation?
    
    init() {
	   self.locationViewModel = LocationViewModel()
	   locationViewModel.getAllLocation()
	   
	   self._currentLocation = State(initialValue: CurrentLocation(latitude: 44.83, longitude: 44.83))
    }
    
    var body: some View {
	   NavigationView {
		  List(locationViewModel.locations, id: \.id) { location in
			 VStack(alignment: .leading, spacing: 8) {
				Text(location.name)
				    .font(.headline)
				
				if let currentLocation = currentLocation {
				    Text(String(format: "%.2f km away", location.latitude, location.longitude))
					   .font(.subheadline)
					   .foregroundColor(.gray)
				}
			 }
		  }
		  .navigationTitle("Locations")
	   }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
	   LocationView()
    }
}
