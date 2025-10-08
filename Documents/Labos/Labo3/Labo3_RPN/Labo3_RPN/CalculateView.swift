//
//  CalculateView.swift
//  Labo3_RPN
//
//  Created by Ilona Defevere on 08/10/2025.
//

import SwiftUI

struct CalculateView: View {
    @State var calcEngine = calcEngine()
    @State var enteredNumber: Int
    var body: some View {
        HStack {
            VStack {
                TextEditor(text: calcEngine.showResult())
                    //nog te doen: afmetingen
                    //te doen: not editable maken
            }
            Grid {
                GridRow {
                    ForEach(7..<10) {
                        number in
                        Button("\(number)") {
                            enteredNumber = number
                        }
                    }
                    Button("/") {
                        //nog toe te voegen
                    }
                }
                GridRow {
                    ForEach(4..<7) {
                        number in
                        Button("\(number)") {
                            //nog toe te voegen
                        }
                    }
                    Button("*") {
                        calcEngine.calculateResult("*")
                    }
                }
                GridRow {
                    ForEach(1..<4) {
                        number in
                        Button("\(number)") {
                            //nog toe te voegen
                        }
                    }
                    Button("-") {
                        calcEngine.calculateResult("-")
                    }
                }
                GridRow {
                    Button("0") {
                        //nog toe te voegen
                    }
                    Text("")
                    Text("")
                    Button("+") {
                        calcEngine.calculateResult("+")
                    }
                }
                GridRow {
                    Button("Clear") {
                        calcEngine.clearResult()
                    }.gridCellColumns(2)

                    Button("Enter") {
                        calcEngine.addToStack()
                    }.gridCellColumns(2)
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
    CalculateView()
}
