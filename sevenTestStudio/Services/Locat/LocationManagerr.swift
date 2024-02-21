//
//  LocationResponse.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 18.02.2024.
//

//import CoreLocation

//в application нужен этот файл, но не уверен, что надо
//.environmentObject(LocationManagerr.shared)
//
//class LocationManagerr: NSObject, CLLocationManagerDelegate, ObservableObject {
//    static let shared = LocationManagerr()
//    
//    @Published var currentLocation: CLLocationCoordinate2D?
//    private var locationManager = CLLocationManager()
//    
//    override init() {
//	   super.init()
//	   self.locationManager.delegate = self
//	   self.locationManager.requestWhenInUseAuthorization()
//	   self.locationManager.startUpdatingLocation()
//    }
//    
//    func setupLocationManager() {
//	   locationManager.delegate = self
//	   locationManager.requestWhenInUseAuthorization()
//	   locationManager.desiredAccuracy = kCLLocationAccuracyBest
//	   locationManager.startUpdatingLocation()
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//	   guard let location = locations.last?.coordinate else { return }
//	   currentLocation = location
//    }
//}
