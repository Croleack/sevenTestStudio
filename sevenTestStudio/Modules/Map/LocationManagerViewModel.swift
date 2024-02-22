//
//  LocationManagerViewModel.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 21.02.2024.
//

import Foundation
import MapKit

class LocationManagerViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let networkManager = NetworkManager()
    var locationManager: CLLocationManager?
//    var serachTerm = ""
    //
    @Published private(set) var currentLocation: CLLocationCoordinate2D?
    
    @Published var cafes: [Cafe] = []
    @Published var order: [Coffee] = []
    @Published private(set) var places = [Place]()
    @Published private(set) var selectedPlace: Place?
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(
	   latitude: 0,
	   longitude: 0),
									  span: MKCoordinateSpan(
									   latitudeDelta: 0.1,
									   longitudeDelta: 0.1))
    
    var selectedPlaceName: String {
	   guard let selectPlace = selectedPlace else { return ""}
	   
	   return selectPlace.name
    }
    
    var selectedPlaceAdress: String {
	   guard let selectPlace = selectedPlace else { return ""}
	   if let street = selectPlace.placemark.thoroughfare,
		 let subAdress = selectPlace.placemark.subThoroughfare {
		  return street + ", " + subAdress
	   }
	   return ""
    }
    
    func checkLocationIsEnabled() {
	   if CLLocationManager.locationServicesEnabled() {
		  locationManager = CLLocationManager()
		  locationManager?.delegate = self
	   } else {
		  print("упс не включил локацию")
	   }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
	   checkLocationAuth()
    }
    
    func checkLocationAuth() {
	   guard let locationManager = locationManager else { return }
	   switch locationManager.authorizationStatus {
	   case .notDetermined:
		  locationManager.requestWhenInUseAuthorization()
	   case .restricted:
		  print("Ограничен")
	   case .denied:
		  print("Отключены")
	   case .authorizedAlways, .authorizedWhenInUse:
		  if let userLocation = locationManager.location {
			 region = MKCoordinateRegion(
				center: userLocation.coordinate,
				span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
			 )
			 currentLocation = userLocation.coordinate
		  } else {
			 print("Не удалось получить текущее местоположение")
		  }
	   @unknown default:
		  break
	   }
    }
    
//    func serch() {
//	   let request = MKLocalSearch.Request()
//	   request.naturalLanguageQuery = serachTerm
//	   request.region = region
//	   
//	   let search = MKLocalSearch(request: request)
//	   
//	   search.start { response, error in
//		  guard let response = response else {
//			 if let error = error {
//				print("Ошибка поиска: \(error.localizedDescription)")
//			 }
//			 return
//		  }
//		  
//		  DispatchQueue.main.async {
//			 self.places = response.mapItems.map({ item in
//				Place(name: item.name ?? "",
//					 placemark: item.placemark,
//					 coordinate: item.placemark.coordinate,
//					 adress: item.placemark.locality
//				)
//			 })
//		  }
//	   }
//    }
    
    func selectedPlace(for place: Place) {
	   self.selectedPlace = place
    }
    
    func addCafesToMap() {
	   places.removeAll()
	   
	   let cafeLoc = cafes
	   
	   for cafe in cafeLoc {
		  let place = Place(name: cafe.name,
						placemark: MKPlacemark(coordinate: cafe.coordinate),
						coordinate: cafe.coordinate,
						adress: "")
		  places.append(place)
	   }
    }
    
    func loadCafes() {
	   networkManager.loadCafes { success, error in
		  if let error = error {
			 print(error)
			 return
		  }
		  
		  if let cafes = success {
			 var newCafes = [Cafe]()
			 for cafe in cafes {
				newCafes.append(cafe.mapToCafe)
			 }
			 
			 DispatchQueue.main.async {
				self.cafes = newCafes
				self.addCafesToMap()
			 }
		  }
	   }
    }
}
