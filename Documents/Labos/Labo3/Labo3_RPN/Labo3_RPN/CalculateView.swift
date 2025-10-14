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
    @State var resultText = ""
    @State var enteredNumber: String = ""
    @State var enteredOperand: String = ""
    var body: some View {
        HStack {
            VStack {
                TextEditor(text: .constant(resultText))
                    .frame(width: 200, height: 250)
                    .disabled(true)
            }
            Grid {
                GridRow {
                    ForEach(7..<10) {
                        number in
                        Button("\(number)") {
                            enteredNumber += String(number)
                        }
                    }
                    Button("/") {
                        enteredOperand = "/"
                    }
                }
                GridRow {
                    ForEach(4..<7) {
                        number in
                        Button("\(number)") {
                            enteredNumber += String(number)
                        }
                    }
                    Button("*") {
                        enteredOperand = "*"
                    }
                }
                GridRow {
                    ForEach(1..<4) {
                        number in
                        Button("\(number)") {
                            enteredNumber += String(number)
                        }
                    }
                    Button("-") {
                        enteredOperand = "-"
                    }
                }
                GridRow {
                    Button("0") {
                        enteredNumber += "0"
                    }
                    Text("")
                    Text("")
                    Button("+") {
                        enteredOperand = "+"
                    }
                }
                GridRow {
                    Button("Clear") {
                        calcEngine.clearStack()
                        resultText = ""
                        enteredOperand = ""
                        enteredNumber = ""
                    }
                    .gridCellColumns(2)

                    Button("Enter") {
                        if(enteredOperand == "") {
                            calcEngine.addToStack(getal: Double(enteredNumber)!)
                        } else {
                            calcEngine.calculateResult(operand: enteredOperand)
                        }
                    }
                    .gridCellColumns(2)
                }
            }
        }
        HStack {
            Button("Show Stack") {
                enteredNumber = ""
                enteredOperand = ""
                calcEngine.clearResult()
                resultText = calcEngine.showResult()
            }
        }
    }
}

#Preview {
    CalculateView()
}
