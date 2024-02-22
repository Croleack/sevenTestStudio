//
//  OrderView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 19.02.2024.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var cafesVM: CafesViewModel
    
    var body: some View {
	   NavigationStack {
		  ScrollView {
			 ForEach(Array(cafesVM.order.enumerated()), id: \.element.id) { index, coffee in
				if coffee.count != 0 {
				    
				    HStack(spacing: .zero) {
					   VStack(alignment: .leading) {
						  Text(coffee.name)
							 .bold()
							 .font(.title2)
							 .foregroundColor(Color("headerTextField"))
						  Text("\(coffee.amount.description) руб")
							 .font(.subheadline)
							 .foregroundColor(Color("textField"))
					   }
					   .padding(.leading, 10)
					   
					   Spacer()
					   
					   VStack {
						  HStack {
							 Button(action: {
								cafesVM.decrementCoffeeCount(for: coffee)
							 }) {
								Image("ic-minus")
								    .frame(width: 12,
										 height: 12
								    )
								    .padding(.trailing, 9)
							 }
							 
							 Text("\(coffee.count.description)")
								.italic()
								.padding(.trailing, 15)
								.foregroundColor(Color("headerTextField"))
							 
							 Button(action: {
								cafesVM.incrementCoffeeCount(for: coffee)
							 }) {
								Image("ic-plus")
								    .frame(width: 12,
										 height: 12
								    )
								    .padding(.trailing, 16)
							 }
						  }
					   }
				    }
				    .frame(width: UIScreen.main.bounds.width - 26,
						 height: 71)
				    .background(Color("foregroundCell"))
				    .cornerRadius(5)
				}
			 }
		  }
		  .padding(.top, 15)
		  VStack {
			 Text("Время ожидания заказа 15 минут! Спасибо, что выбрали нас!")
				.padding(.bottom, 159.51)
				.foregroundColor(Color("headerTextField"))
				.font(.system(size: 24))
				.multilineTextAlignment(.center)
				.padding(.horizontal, 13)
				.lineLimit(3)
			 
			 ButtonView(title: "Оплатить") {
			 }
		  }
	   }
	   .toolbar {
		  ToolbarItem(placement: .navigationBarLeading) {
			 BackButton(text: "Ваш заказ")
		  }
	   }
    }
}
