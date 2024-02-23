//
//  CafesViewModel.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 18.02.2024.
//

import Foundation
import MapKit
import SwiftUI

class CafesViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    @Published var cafes: [Cafe] = []
    @Published var order: [Coffee] = []
    
    init() {
	   self.loadCafes()
    }
    //MARK: - functions that go to the network
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
			 }
		  }
	   }
    }
    
    func loadCafe(id: Int) {
	   networkManager.loadCafe(id: id) { success, error in
		  if let error = error {
			 print(error)
			 return
		  }
		  
		  if let order = success {
			 var newOrder = [Coffee]()
			 for coffee in order {
				newOrder.append(coffee.mapToCoffee)
			 }
			 
			 DispatchQueue.main.async {
				self.order = newOrder
			 }
		  }
	   }
    }
    //MARK: - functions for counting the amount of coffee
    func incrementCoffeeCount(for coffee: Coffee) {
	   if let index = order.firstIndex(where: { $0.id == coffee.id }) {
		  order[index].count += 1
	   }
    }
    
    func decrementCoffeeCount(for coffee: Coffee) {
	   if let index = order.firstIndex(where: { $0.id == coffee.id }), order[index].count > 0 {
		  order[index].count -= 1
	   }
    }
}
