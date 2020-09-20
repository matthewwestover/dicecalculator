//
//  CalcInputView.swift
//  DiceCalculator
//
//  Created by Matt Westover on 9/20/20.
//  Copyright © 2020 Matt Westover. All rights reserved.
//

import SwiftUI

struct CalcInputView: View {
	let inpExpr: String
	
    var body: some View {
		HStack{
			Spacer()
			Text(inpExpr)
				.font(Font.custom("Scaly Sans", size: 25))
				.foregroundColor(.white)
				.padding(.trailing)
				.padding(.top, 5)
				.padding(.bottom, 5)
		}
		.background(Color.whiteop)
		
    }
}

struct CalcInputView_Previews: PreviewProvider {
    static var previews: some View {
        CalcInputView(inpExpr: "5 + 1d20")
    }
}
