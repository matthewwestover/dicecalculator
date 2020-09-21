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
	let incoming: String
	@State var disp:Bool = false
	
	
	var body: some View {
		VStack{
			HStack{
				if(disp == false){
					VStack{
						Image(systemName: "arrowtriangle.up.fill")
							.font(.system(size: 20))
							.foregroundColor(.gray)
							.frame(width: 20)
							.padding(.bottom, 5)
						Image(systemName: "arrowtriangle.down.fill")
							.foregroundColor(.gray)
							.font(.system(size: 20))
							.frame(width: 20)
							.padding(.bottom, 5)
					}
					.padding(.leading, 10)
					.frame(width: 50)
					.onTapGesture {
						disp = true
					}
				}
				if(disp == true){
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
					.onTapGesture {
						disp = false
					}
				}
				Spacer()
				if(disp == false){
					Text(incoming + " =")
						.font(Font.custom("Scaly Sans", size: 20))
						.foregroundColor(Color.gray)
				}
				
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
		CalcResultView(final: "18", maxVal: "888", halfVal: "888", incoming: "5 + (15)")
	}
}
