//
//  CalcButton.swift
//  Labo3_RPN
//
//  Created by Ilona Defevere on 15/10/2025.
//

import SwiftUI

struct CalcButton: View {
    let operand: String
    //binding om de waarden te kunnen terugsturen
    @Binding var calcEngine: CalcEngine
    @Binding var resultText: String
    @Binding var enteredNumber: String
    var body: some View {
        Button(operand) {
            //controleren of er een nummer is toegevoegd zonder enter (en dan toevoegen indien nodig)
            if enteredNumber != "" {
                calcEngine.addToStack(getal: Double(enteredNumber)!)
                enteredNumber = ""
            }
            //resultaat berekenen
            calcEngine.calculateResult(operand: operand)
            //resultText (text in TextEditor) updaten
            resultText = calcEngine.showResult()
        }
    }
}
