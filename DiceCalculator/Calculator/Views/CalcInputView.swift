//
//  CalcInputView.swift
//  DiceCalculator
//
//  Created by Matt Westover on 9/20/20.
//  Copyright © 2020 Matt Westover. All rights reserved.
//

import SwiftUI

struct CalcInputView: View {
	@EnvironmentObject var model: CalcModel
	
    var body: some View {
		VStack (spacing: 0){
			HStack{
				Spacer()
				Text(model.inputExpr)
					.font(Font.custom("Scaly Sans", size: 30))
					.foregroundColor(.white)
					.padding(.trailing)
					.padding(.top, 5)
					.padding(.bottom, 5)
					.frame(height: 35)
			}
			.background(Color.whiteop)
			VStack{
				Color.calcOrange.frame(height:CGFloat(5))
			}
		}
    }
}

struct CalcInputView_Previews: PreviewProvider {
    static var previews: some View {
		CalcInputView().background(Color.black).environmentObject(CalcModel())
    }
}
