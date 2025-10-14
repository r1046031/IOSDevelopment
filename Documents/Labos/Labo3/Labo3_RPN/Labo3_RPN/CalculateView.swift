//
//  CalculateView.swift
//  Labo3_RPN
//
//  Created by Ilona Defevere on 08/10/2025.
//

//probleem met nummers ingeven zal ontstaan
//opl
//1  numbertext;removeFirst(numberText.count)
//2  numbertext = "numberText" + "number"
//3  result = "numbertext" + "result"

import SwiftUI

struct CalculateView: View {
    @State var calcEngine = CalcEngine()
    @State var enteredNumber: Double
    var body: some View {
        HStack {
            VStack {
                @State var resultText = calcEngine.showResult()
                TextEditor(text: $resultText)
                    .frame(width: 200, height: 100)
                    .disabled(true)
            }
            Grid {
                GridRow {
                    ForEach(7..<10) {
                        number in
                        Button("\(number)") {
                            enteredNumber = Double(number)
                        }
                    }
                    Button("/") {
                        calcEngine.calculateResult(operand: "/")
                    }
                }
                GridRow {
                    ForEach(4..<7) {
                        number in
                        Button("\(number)") {
                            enteredNumber = Double(number)
                        }
                    }
                    Button("*") {
                        calcEngine.calculateResult(operand: "*")
                    }
                }
                GridRow {
                    ForEach(1..<4) {
                        number in
                        Button("\(number)") {
                            enteredNumber = Double(number)
                        }
                    }
                    Button("-") {
                        calcEngine.calculateResult(operand: "-")
                    }
                }
                GridRow {
                    Button("0") {
                        enteredNumber = 0
                    }
                    Text("")
                    Text("")
                    Button("+") {
                        calcEngine.calculateResult(operand: "+")
                    }
                }
                GridRow {
                    Button("Clear") {
                        calcEngine.clearResult()
                    }
                    .gridCellColumns(2)

                    Button("Enter") {
                        calcEngine.addToStack(getal: enteredNumber)
                    }
                    .gridCellColumns(2)
                }
            }
        }
        HStack {
            Button("Show Stack") {
                //nog toe te voegen
            }
        }
    }
}

#Preview {
    
}
