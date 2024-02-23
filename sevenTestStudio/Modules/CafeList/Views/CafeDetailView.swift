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
	   GridItem(.adaptive(minimum: Constants.minimumColumnWidth,
					  maximum: Constants.maximumColumnWidth)),
	   GridItem(.adaptive(minimum: Constants.minimumColumnWidth,
					  maximum: Constants.maximumColumnWidth)
	   )
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
					   RoundedRectangle(cornerRadius: Constants.cornerRadius)
						  .frame(width: Constants.cardWidth,
							    height: Constants.cardHeight)
						  .foregroundStyle(.white)
						  .shadow(radius: Constants.shadowRadius)
						  .padding(.horizontal, Constants.cardPadding)
					   
					   if let coffee = cafesVM.order[safe: index] {
						  VStack {
							 AsyncImage(url: coffee.image) { image in
								image
								    .resizable()
								    .aspectRatio(contentMode: Constants.imageContentMode)
								    .scaledToFit()
								    .frame(width: Constants.imageWidth,
										 height: Constants.imageHeight)
							 } placeholder: {
								LoadingView()
							 }
							 VStack(alignment: .leading,
								   spacing: Constants.vStackSpacing) {
								Text(coffee.name)
								    .font(Constants.nameFont)
								    .foregroundColor(Color(Constants.textFieldColor))
								
								HStack(spacing: Constants.hStackSpacing) {
								    Text("\(coffee.amount) \(Constants.currency)")
									   .bold()
									   .font(Constants.amountFont)
								    Button(action: {
									   cafesVM.decrementCoffeeCount(for: coffee)
								    }) {
									   Image(Constants.minusImage)
										  .frame(width: Constants.buttonWidth,
											    height: Constants.buttonHeight)
										  .padding(.leading, Constants.buttonLeadingPadding)
								    }
								    Text(coffee.count.description)
									   .italic()
									   .padding(.leading, Constants.countLeadingPadding)
									   .foregroundColor(Color(Constants.headerTextFieldColor))
									   .font(Constants.countFont)
								    Button(action: {
									   cafesVM.incrementCoffeeCount(for: coffee)
								    }) {
									   Image(Constants.plusImage)
										  .frame(width: Constants.buttonWidth,
											    height: Constants.buttonHeight)
										  .padding(.leading, Constants.buttonLeadingPadding)
								    }
								}
							 }
							 .padding(.leading, Constants.vStackLeadingPadding)
						  }
					   }
				    }
				    .padding(.top, Constants.cardTopPadding)
				    .padding(.horizontal, Constants.cardHorizontalPadding)
				}
			 }
		  }
		  NavigationLink {
			 OrderView(cafesVM: cafesVM)
				.navigationBarBackButtonHidden(true)
		  } label: {
			 Text(Constants.paymentButtonText)
		  }
		  .padding(.bottom, Constants.bottomPadding)
		  .buttonStyle(CustomNavigationLinkStyle())
		  .toolbar {
			 ToolbarItem(placement: .navigationBarLeading) {
				BackButton(text: Constants.menuButtonText)
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

// MARK: - Constants

fileprivate extension CafeDetailView {
    enum Constants {
	   static let minimumColumnWidth = 300.0
	   static let maximumColumnWidth = 400.0
	   static let cornerRadius = 5.0
	   static let cardWidth = 165.0
	   static let cardHeight = 205.0
	   static let shadowRadius = 4.0
	   static let cardPadding = 13.0
	   static let hStackSpacing = 0.0
	   static let imageWidth = 165.0
	   static let imageHeight = 137.0
	   static let vStackSpacing = 12.0
	   static let buttonWidth = 12.0
	   static let buttonHeight = 12.0
	   static let buttonLeadingPadding = 9.0
	   static let countLeadingPadding = 15.0
	   static let vStackLeadingPadding = 10.0
	   static let cardTopPadding = 13.0
	   static let cardHorizontalPadding = 13.0
	   static let bottomPadding = 32.49
	   static let countFont = Font.system(size: 14)
	   static let nameFont = Font.subheadline
	   static let imageContentMode = ContentMode.fill
	   static let amountFont = Font.system(size: 14)
	   static let textFieldColor = "textField"
	   static let minusImage = "ic-yellowMinus"
	   static let headerTextFieldColor = "headerTextField"
	   static let plusImage = "ic-yellowPlus"
	   static let paymentButtonText = "Перейти к оплате"
	   static let menuButtonText = "Меню"
	   static let currency = "руб"
    }
}


