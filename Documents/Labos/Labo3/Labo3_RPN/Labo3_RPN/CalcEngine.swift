//
//  CalcEngine.swift
//  Labo3_RPN
//
//  Created by Ilona Defevere on 08/10/2025.
//

import Foundation

@Observable class CalcEngine{
    var result: String = ""
    var stack = [Double]()
    
    func addToStack (getal: Double) {
        stack[(stack.count) - 1] = getal
    }
    
    func calculateResult (operand: String) {
        var resultCalc: Double
        if operand == "+" {
            resultCalc = stack[(stack.count) - 1] + stack[(stack.count) - 2]
        } else if operand == "-" {
            resultCalc = stack[(stack.count) - 1] - stack[(stack.count) - 2]
        } else if operand == "*" {
            resultCalc = stack[(stack.count) - 1] * stack[(stack.count) - 2]
        } else {
            resultCalc = stack[(stack.count) - 1] / stack[(stack.count) - 2]
        }
        
        result += String(operand) + "\n" + String(resultCalc) + "\n"
    }
    
    func clearResult () {
        stack = []
        result = ""
    }
    
    func showResult () -> (String) {
        return result
    }
}
