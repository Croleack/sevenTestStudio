//
//  LocationViewModel.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 18.02.2024.
//

import Foundation

class LocationViewModel: ObservableObject {
    
    @Published var locations: [LocationResponseViewModel] = []
    
    func getAllLocation() {
	   let defaults = UserDefaults.standard
	   guard let token = defaults.string(forKey: "token") else {
		  return
	   }
	   
	   WebService().getAllLocat(token: token) { result in
		  DispatchQueue.main.async {
			 switch result {
			 case .success(let locations):
				self.locations = locations.map(LocationResponseViewModel.init)
			 case .failure(let error):
				print(error)
				
			 }
		  }
	   }
    }
}

struct LocationResponseViewModel {
    let locations: LocationResponse
    let id = UUID()
    
    var name: String {
	   return locations.name
    }
    
    var point: Point {
	   return locations.point
    }
    
    var latitude: Double {
	   return point.latitude
    }
    
    var longitude: Double {
	   return point.longitude
    }
}
