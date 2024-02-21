//
//  LocationModel.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 21.02.2024.
//

import Foundation
import MapKit

struct Place: Identifiable {
    var id: UUID = UUID()
    var name: String
    var placemark: MKPlacemark
    var coordinate: CLLocationCoordinate2D
    var adress: String? 
}
