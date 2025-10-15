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
    var enteredNumbers = [Double]()
    
    func addToStack (getal: Double) {
        stack.append(getal)
        enteredNumbers.append(getal)
    }
    
    func calculateResult (operand: String) {
        //lengte controleren
        if stack.count >= 2 {
            var laatste: Double = Double(stack.popLast()!)
            var voorlaatste: Double = Double(stack.popLast()!)
            
            var resultCalc: Double
            
            if operand == "+" {
                resultCalc = laatste + voorlaatste
            } else if operand == "-" {
                resultCalc = laatste - voorlaatste
            } else if operand == "*" {
                resultCalc = laatste * voorlaatste
            } else {
                resultCalc = laatste / voorlaatste
            }
            
            result = String(resultCalc) + "\n" + operand + "\n" + result
            addToStack(getal: resultCalc)
            enteredNumbers.popLast()
        } else {
            result = "Not enough operands..." + "\n" + operand + "\n" + result
        }
    }
    
    func clearResult () {
        result = ""
    }
    
    func clearStack () {
        clearResult()
        stack = []
    }
    
    func showResult () -> (String) {
        return result + "\(enteredNumbers)"
    }
}
