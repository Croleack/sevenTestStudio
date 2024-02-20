//
//  CoffeeCellView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import SwiftUI

struct CoffeeCellView: View {
    @Binding var coffee: Coffee
    
    var body: some View {
	   RoundedRectangle(cornerRadius: 10)
		  .frame(idealWidth: 370, idealHeight: 220)
		  .foregroundStyle(.white)
		  .shadow(radius: 4)
		  .overlay {
			 VStack {
				AsyncImage(url: coffee.image) { image in
				    image
					   .resizable()
					   .scaledToFit()
					   .clipShape(.rect(cornerRadius: 10))
				} placeholder: {
				    Image(systemName: "cup.and.saucer")
					   .resizable()
					   .scaledToFit()
				}
				.frame(idealHeight: 120)
				Spacer()
				VStack {
				    HStack {
					   Spacer()
					   Text(coffee.name)
					   Spacer()
					   Text("\(coffee.amount) ₽")
						  .bold()
					   Spacer()
				    }
				    HStack {
					   Text(coffee.count.description)
					   Stepper("", value: $coffee.count, in: 0...10)
				    }
				    .padding(.horizontal)
				}
				.padding(10)
			 }
		  }
		  .padding(5)
    }
}
