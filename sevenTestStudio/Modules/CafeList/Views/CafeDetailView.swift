//
//  MenuView.swift
//  sevenTestStudio
//
//  Created by Enzhe Gaysina on 18.02.2024.
//

import SwiftUI

struct CafeDetailView: View {
    var id: Int
    @ObservedObject var cafesVM: CafesViewModel
    
    var columns: [GridItem] = [
	   GridItem(.adaptive(minimum: 300, maximum: 400)),
	   GridItem(.adaptive(minimum: 300, maximum: 400))
    ]
    
    var body: some View {
	   NavigationStack {
		  ScrollView {
			 LazyVGrid(
				columns: columns,
				alignment: .center,
				pinnedViews: [.sectionHeaders, .sectionFooters]
			 ) {
				ForEach(cafesVM.order.indices, id: \.self) { index in
				    ZStack {
					   RoundedRectangle(cornerRadius: 5)
						  .frame(width: 165, height: 205)
						  .foregroundStyle(.white)
						  .shadow(radius: 4)
						  .padding(.horizontal, 13)
					   
					   if let coffee = cafesVM.order[safe: index] {
						  VStack {
							 AsyncImage(url: coffee.image) { image in
								image
								    .resizable()
								    .aspectRatio(contentMode: .fill)
								    .scaledToFit()
								    .frame(width: 165, height: 137)
								
							 } placeholder: {
								ProgressView()
								    .scaleEffect(2)
							 }
							 VStack(alignment: .leading, spacing: 12) {
							 Text(coffee.name)
								.font(.subheadline)
								.foregroundColor(Color("textField"))
							 
							 HStack(spacing: .zero) {
								Text("\(coffee.amount) руб")
								    .bold()
								    .font(.system(size: 14))
								Button(action: {
								    cafesVM.decrementCoffeeCount(for: coffee)
								}) {
								    Image("ic-yellowMinus")
									   .frame(width: 12,
											height: 12
									   )
									   .padding(.leading, 9)
								}
								Text(coffee.count.description)
								    .italic()
								    .padding(.leading, 15)
								    .foregroundColor(Color("headerTextField"))
								    .font(.system(size: 14))
								
								Button(action: {
								    cafesVM.incrementCoffeeCount(for: coffee)
								}) {
								    Image("ic-yellowPlus")
									   .frame(width: 12,
											height: 12
									   )
									   .padding(.leading, 15)
								}
							 }
							 }
							 .padding(.leading, 10)
							 
						  }
					   }
				    }
				    .padding(.top, 13)
				    .padding(.horizontal, 13)
				}
			 }
		  }
		  NavigationLink {
			 OrderView(cafesVM: cafesVM)
				.navigationBarBackButtonHidden(true)
		  } label: {
			 Text("Перейти к оплате")
		  }
		  .padding(.bottom, 32.49)
		  .buttonStyle(CustomNavigationLinkStyle())
		  .toolbar {
			 ToolbarItem(placement: .navigationBarLeading) {
				BackButton(text: "Меню")
			 }
		  }
		  .onAppear {
			 cafesVM.loadCafe(id: id)
		  }
		  .refreshable {
			 cafesVM.loadCafe(id: id)
		  }
	   }
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
	   return indices.contains(index) ? self[index] : nil
    }
}
