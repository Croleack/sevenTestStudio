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
				if coffee.count != .zero {
				    HStack(spacing: .zero) {
					   VStack(alignment: .leading) {
						  Text(coffee.name)
							 .bold()
							 .font(Constants.titleFont)
							 .foregroundColor(Color(Constants.headerTextFieldColor))
						  Text("\(coffee.amount) \(Constants.currency)")
							 .font(Constants.subheadlineFont)
							 .foregroundColor(Color(Constants.subtitleForeground))
					   }
					   .padding(.leading, Constants.leadingPadding)
					   
					   Spacer()
					   
					   VStack {
						  HStack {
							 Button(action: {
								cafesVM.decrementCoffeeCount(for: coffee)
							 }) {
								Image(Constants.imageMinus)
								    .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
								    .padding(.trailing, Constants.buttonTrailingPadding)
							 }
							 
							 Text(coffee.count.description)
								.italic()
								.padding(.trailing, Constants.trailingPadding)
								.foregroundColor(Color(Constants.headerTextFieldColor))
							 
							 Button(action: {
								cafesVM.incrementCoffeeCount(for: coffee)
							 }) {
								Image(Constants.imagePlus)
								    .frame(width: Constants.buttonWidth, height: Constants.buttonHeight)
								    .padding(.trailing, Constants.buttonTrailingPadding)
							 }
						  }
					   }
				    }
				    .frame(width: UIScreen.main.bounds.width - Constants.cardPadding,
						 height: Constants.cardHeight)
				    .background(Color(Constants.foregroundCellColor))
				    .cornerRadius(Constants.cornerRadius)
				}
			 }
			 VStack {
				Text(Constants.waitingTimeText)
				    .padding(.top, Constants.waitingTimeTopPadding)
				    .foregroundColor(Color(Constants.headerTextFieldColor))
				    .font(.system(size: Constants.waitingTimeFontSize))
				    .multilineTextAlignment(.center)
				    .padding(.horizontal, Constants.waitingTimeHorizontalPadding)
				    .lineLimit(Constants.waitingTimeLineLimit)
			 }
		  }
		  .padding(.top, Constants.scrollViewTopPadding)
		  ButtonView(title: Constants.paymentButtonTitle) {
		  }
		  .padding(.bottom, Constants.bottomPadding)
	   }
	   .toolbar {
		  ToolbarItem(placement: .navigationBarLeading) {
			 BackButton(text: Constants.navigationBarTitle)
		  }
	   }
    }
}

// MARK: - Constants

fileprivate extension OrderView {
    enum Constants {
	   static let subtitleForeground = "textField"
	   static let imageMinus = "ic-minus"
	   static let imagePlus = "ic-plus"
	   static let foregroundCellColor = "foregroundCell"
	   static let headerTextFieldColor = "headerTextField"
	   static let waitingTimeText = "Время ожидания заказа 15 минут! Спасибо, что выбрали нас!"
	   static let paymentButtonTitle = "Оплатить"
	   static let navigationBarTitle = "Ваш заказ"
	   static let currency = "руб"
	   static let subheadlineFont = Font.subheadline
	   static let titleFont = Font.title2
	   static let leadingPadding = 10.0
	   static let buttonWidth = 12.0
	   static let buttonHeight = 12.0
	   static let buttonTrailingPadding = 16.0
	   static let trailingPadding = 15.0
	   static let cardPadding = 26.0
	   static let cardHeight = 71.0
	   static let cornerRadius = 5.0
	   static let scrollViewTopPadding = 15.0
	   static let waitingTimeTopPadding = 78.0
	   static let waitingTimeFontSize = 24.0
	   static let waitingTimeHorizontalPadding = 13.0
	   static let waitingTimeLineLimit = 3
	   static let bottomPadding = 32.49
	  
    }
}
