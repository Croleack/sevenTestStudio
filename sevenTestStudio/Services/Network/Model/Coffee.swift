//
//  Coffee.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 20.02.2024.
//

import Foundation

struct Coffee: Identifiable {
    var id: Int
    var name: String
    var amount: Int
    var image: URL?
    
    var count: Int = 0
}

extension CoffeeResponse {
    var mapToCoffee: Coffee {
	   return Coffee(
		  id: self.id ?? 0,
		  name: self.name ?? "",
		  amount: self.price ?? 0,
		  image: URL(string: self.imageURL ?? "")
	   )
    }
}
