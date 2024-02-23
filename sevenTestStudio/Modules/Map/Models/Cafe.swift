//
//  Cafe.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import Foundation
import MapKit

struct Cafe: Identifiable, Equatable {
    var id: Int
    var name: String
    var coordinate: CLLocationCoordinate2D
    
    func distance(to currentLocation: CLLocationCoordinate2D) -> String {
	   let cafeLocation = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
	   let currentCLLocation = CLLocation(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
	   let distanceInMeters = cafeLocation.distance(from: currentCLLocation)
	   let distanceInKilometers = distanceInMeters / 1000
	   
	   return String(format: "%.2f км от вас", distanceInKilometers)
    }
    
    static func == (lhs: Cafe, rhs: Cafe) -> Bool {
	   return lhs.id == rhs.id
    }
}

extension ShortCafeResponse {
    var mapToCafe: Cafe {
	   let coordinate = CLLocationCoordinate2D(
		  latitude: Double(self.point?.latitude ?? "") ?? .zero,
		  longitude: Double(self.point?.longitude ?? "") ?? .zero
	   )
	   return Cafe(
		  id: self.id ?? .zero,
		  name: self.name ?? "",
		  coordinate: coordinate
	   )
    }
}
