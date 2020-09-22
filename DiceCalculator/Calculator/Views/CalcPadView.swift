//
//  CalcPadView.swift
//  DiceCalculator
//
//  Created by Matt Westover on 9/20/20.
//  Copyright © 2020 Matt Westover. All rights reserved.
//

import SwiftUI

struct CalcPadView: View {
	@EnvironmentObject var model: CalcModel
	
	var body: some View {
		GeometryReader { geometry in
			HStack (spacing: 0){
				// Left-most Column
				VStack (spacing: 0){
					// Clear All Input Button
					Button(action: {
						model.clearInput()
					}){ HStack {
						Image(systemName: "clear.fill")
							.font(.system(size: 30))
							.foregroundColor(Color.white)
						Text("Clear")
							.font(Font.custom("Bookinsanity", size: 14))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.sorcerer)
					}
					
					// d4 Button
					Button(action: {
						model.addDice(value: "d4")
					}){ HStack {
						Image("D4").resizable()
							.foregroundColor(Color.white)
							.frame(width: 30, height: 30)
						Text("d4")
							.font(Font.custom("Bookinsanity", size: 20))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcDark)
					}
					
					// d10 Button
					Button(action: {
						model.addDice(value: "d10")
					}){ HStack {
						Image("D10").resizable()
							.foregroundColor(Color.white)
							.frame(width: 30, height: 30)
						Text("d10")
							.font(Font.custom("Bookinsanity", size: 20))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcDark)
					}
					
					// 7 Button
					Button(action: {
						model.receiveInput(value: "7")
					}){ HStack {
						Text("7")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// 4 Button
					Button(action: {
						model.receiveInput(value: "4")
					}){ HStack {
						Text("4")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// 1 Button
					Button(action: {
						model.receiveInput(value: "1")
					}){ HStack {
						Text("1")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// 0 Button
					Button(action: {
						model.receiveInput(value: "0")
					}){ HStack {
						Text("0")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
				}
				.frame(width: geometry.size.width / 4)
				
				
				
				VStack (spacing: 0){ // Left Middle Column
					// d% Button
					Button(action: {
						model.addDice(value: "d100")
					}){ HStack {
						Image("DPer").resizable()
							.foregroundColor(Color.white)
							.frame(width: 30, height: 30)
						Text("d%")
							.font(Font.custom("Bookinsanity", size: 20))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcDark)
					}
					
					// d6 Button
					Button(action: {
						model.addDice(value: "d6")
					}){ HStack {
						Image("D6").resizable()
							.foregroundColor(Color.white)
							.frame(width: 30, height: 30)
						Text("d6")
							.font(Font.custom("Bookinsanity", size: 20))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcDark)
					}
					
					// d12 Button
					Button(action: {
						model.addDice(value: "d12")
					}){ HStack {
						Image("D12").resizable()
							.foregroundColor(Color.white)
							.frame(width: 30, height: 30)
						Text("d12")
							.font(Font.custom("Bookinsanity", size: 20))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcDark)
					}
					
					// 8 Button
					Button(action: {
						model.receiveInput(value: "8")
					}){ HStack {
						Text("8")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// 5 Button
					Button(action: {
						model.receiveInput(value: "5")
					}){ HStack {
						Text("5")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// 2 Button
					Button(action: {
						model.receiveInput(value: "2")
					}){ HStack {
						Text("2")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// ( Button
					Button(action: {
						model.receiveInput(value: "(")
					}){ HStack {
						Text("(")
							.font(Font.custom("Bookinsanity", size: 45))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcOrange)
					}
				}
				.frame(width: geometry.size.width / 4)
				
				// Right Middle Column
				VStack (spacing: 0){
					// dX Button
					Button(action: {
						model.addDice(value: "d")
					}){ HStack {
						Image("Dice").resizable()
							.foregroundColor(Color.white)
							.frame(width: 30, height: 30)
						Text("dX")
							.font(Font.custom("Bookinsanity", size: 20))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcDark)
					}
					
					// d8 Button
					Button(action: {
						model.addDice(value: "d8")
					}){ HStack {
						Image("D8").resizable()
							.foregroundColor(Color.white)
							.frame(width: 30, height: 30)
						Text("d8")
							.font(Font.custom("Bookinsanity", size: 20))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcDark)
					}
					
					// d20 Button
					Button(action: {
						model.addDice(value: "d20")
					}){ HStack {
						Image("D20").resizable()
							.foregroundColor(Color.white)
							.frame(width: 30, height: 30)
						Text("d20")
							.font(Font.custom("Bookinsanity", size: 20))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcDark)
					}
					
					// 9 Button
					Button(action: {
						model.receiveInput(value: "9")
					}){ HStack {
						Text("9")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// 6 Button
					Button(action: {
						model.receiveInput(value: "6")
					}){ HStack {
						Text("6")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// 3 Button
					Button(action: {
						model.receiveInput(value: "3")
					}){ HStack {
						Text("3")
							.font(Font.custom("Scaly Sans", size: 45))
							.foregroundColor(.black)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcLight)
					}
					
					// ) Button
					Button(action: {
						model.receiveInput(value: ")")
					}){ HStack {
						Text(")")
							.font(Font.custom("Bookinsanity", size: 45))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcOrange)
					}
				}
				.frame(width: geometry.size.width / 4)
				
				// Right-most Column
				VStack (spacing: 0){
					// Backspace
					Button(action: {
						model.backspace()
					}){ HStack {
						Image(systemName: "delete.left.fill")
							.font(.system(size: 40))
							.foregroundColor(Color.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.sorcerer)
					}
					
					// ÷ Button
					Button(action: {
						model.receiveInput(value: "/")
					}){ HStack {
						Text("÷")
							.font(Font.custom("Bookinsanity", size: 45))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcOrange)
					}
					
					// × Button
					Button(action: {
						model.receiveInput(value: "x")
					}){ HStack {
						Text("×")
							.font(Font.custom("Bookinsanity", size: 45))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcOrange)
					}
					
					// - Button
					Button(action: {
						model.receiveInput(value: "-")
					}){ HStack {
						Text("-")
							.font(Font.custom("Bookinsanity", size: 70))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcOrange)
					}
					
					// + Button
					Button(action: {
						model.receiveInput(value: "+")
					}){ HStack {
						Text("+")
							.font(Font.custom("Bookinsanity", size: 45))
							.foregroundColor(.white)
					}
					.frame(width: geometry.size.width / 4, height: geometry.size.height / 7)
					.background(Color.calcOrange)
					}
					
					// Calculate Button
					Button(action: {
						model.calculate()
					}){ HStack {
						Image("DiceRoll").resizable()
							.foregroundColor(Color.white)
							.frame(width: 50, height: 50)
					}
					.frame(width: geometry.size.width / 4, height: (geometry.size.height / 7) * 2)
					.background(Color.calcBlue)
					}
					
				}
				.frame(width: geometry.size.width / 4)
			}
			.frame(width: geometry.size.width, height: geometry.size.height, alignment: .top)
			.background(Color.black)
		}
		
	}
}

struct CalcPadView_Previews: PreviewProvider {
	static var previews: some View {
		CalcPadView().background(Color.black).edgesIgnoringSafeArea(.all).environmentObject(CalcModel())
	}
}
