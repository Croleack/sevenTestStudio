//
//  LocationResponse.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 18.02.2024.
//

import Foundation
import CoreLocation

struct LocationResponse: Codable {
    let id: Int
    let name: String
    let point: Point
}

struct Point: Codable {
    let latitude: Double
    let longitude: Double
    
    func distance(to location: CurrentLocation) -> CLLocationDistance {
	   let coordinate1 = CLLocation(latitude: self.latitude, longitude: self.longitude)
	   let coordinate2 = CLLocation(latitude: location.latitude, longitude: location.longitude)
	   return coordinate1.distance(from: coordinate2) / 1000
    }
}

struct CurrentLocation {
    let latitude: Double
    let longitude: Double
}
