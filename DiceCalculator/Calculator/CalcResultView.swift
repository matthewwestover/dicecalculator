//
//  CalcResultView.swift
//  DiceCalculator
//
//  Created by Matt Westover on 9/20/20.
//  Copyright © 2020 Matt Westover. All rights reserved.
//

import SwiftUI

struct CalcResultView: View {
	let final: String
	let maxVal: String
	let halfVal: String
	
	
	var body: some View {
		VStack{
			HStack{
				HStack{
					VStack{
						Text("Max")
							.font(Font.custom("Bookinsanity", size: 15))
							.foregroundColor(Color.gray)
						Text(maxVal)
							.font(Font.custom("Scaly Sans", size: 25))
							.foregroundColor(Color.gray)
					}
					.frame(width: 60)
					VStack{
						Text("Half")
							.font(Font.custom("Bookinsanity", size: 15))
							.foregroundColor(Color.gray)
						Text(halfVal)
							.font(Font.custom("Scaly Sans", size: 25))
							.foregroundColor(Color.gray)
					}
					.frame(width: 60)
				}
				.padding(.leading, 5)
				Spacer()
				Text(final)
					.font(Font.custom("Scaly Sans Bold", size: 60))
					.foregroundColor(Color.white)
			}
			.padding(.trailing)
			.padding(.top)
			.background(Color.black)
		}
	}
}

struct CalcResultView_Previews: PreviewProvider {
	static var previews: some View {
		CalcResultView(final: "18", maxVal: "888", halfVal: "888")
	}
}
