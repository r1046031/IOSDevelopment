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
    //variabele resultText die resultaat tekst bijhoudt
    @State var resultText = ""
    //variabele enteredNumber omdat 321 1 nummer blijft
    //dan bij het doorgeven naar calcEngine casten naar Double
    @State var enteredNumber: String = ""
    var body: some View {
        //Hstack met TextEditor
        HStack {
            VStack {
                //tekst als constant, met resultText als waarde
                TextEditor(text: .constant(resultText))
                    .frame(width: 200, height: 250)
                //disabled zodat je er niet in kan typen
                    .disabled(true)
            }
            Grid {
                GridRow {
                    //foreach-loop om de number buttons te maken
                    ForEach(7..<10) {
                        number in
                        Button("\(number)") {
                            enteredNumber += String(number)
                        }
                        .colorInvert()
                    }
                    //calcButton (/, *, +, -) via klasse CalcButton
                    CalcButton(operand: "/", calcEngine: $calcEngine, resultText: $resultText, enteredNumber: $enteredNumber)
                }
                GridRow {
                    ForEach(4..<7) {
                        number in
                        Button("\(number)") {
                            enteredNumber += String(number)
                        }
                        //colorinvert voor zwarte button met witte tekst
                        .colorInvert()
                    }
                    CalcButton(operand: "*", calcEngine: $calcEngine, resultText: $resultText, enteredNumber: $enteredNumber)
                }
                GridRow {
                    ForEach(1..<4) {
                        number in
                        Button("\(number)") {
                            enteredNumber += String(number)
                        }
                        .colorInvert()
                    }
                    CalcButton(operand: "-", calcEngine: $calcEngine, resultText: $resultText, enteredNumber: $enteredNumber)
                }
                GridRow {
                    Button("0") {
                        enteredNumber += "0"
                    }
                    .colorInvert()
                    //lege tekstvelden voor ruimte tussen button 0 en + button
                    Text("")
                    Text("")
                    //oorspronkelijk:
//                    Button("+") {
//                        if enteredNumber != "" {
//                            calcEngine.addToStack(getal: Double(enteredNumber)!)
//                            enteredNumber = ""
//                        }
//                        calcEngine.calculateResult(operand: "+")
//                        resultText = calcEngine.showResult()
//                    }
                    CalcButton(operand: "+", calcEngine: $calcEngine, resultText: $resultText, enteredNumber: $enteredNumber)
                }
                GridRow {
                    //button voor te clearen
                    Button("Clear") {
                        calcEngine.clearStack()
                        resultText = ""
                        enteredNumber = ""
                    }
                    //button clear en enter hebben lengte van 2 gewone buttons in de grid
                    .gridCellColumns(2)

                    //enter button voor aan stack getal toe te voegen
                    Button("Enter") {
                        if(enteredNumber != "") {
                            calcEngine.addToStack(getal: Double(enteredNumber)!)
                            enteredNumber = ""
                        }
                    }
                    .gridCellColumns(2)
                }
            }
        }
        HStack {
            //resultText updaten
            Button("Show Stack") {
                resultText = calcEngine.showResult()
            }
        }
    }
}

#Preview {
    CalculateView()
}
