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
        stack.append(getal)
    }
    
    func calculateResult (operand: String) {
        var laatste = stack.popLast()
        var voorlaatste = stack.popLast()
        
        var resultCalc: Double
        
        if operand == "+" {
            resultCalc = laatste + voorlaatste
        } else if operand == "-" {
            resultCalc = laatste - voorlaatste
        } else if operand == "*" {
            resultCalc = laatse * voorlaatste
        } else {
            resultCalc = laatse / voorlaatste
        }
        
        result += String(operand) + "\n" + String(resultCalc) + "\n"
    }
    
    func clearResult () {
        result = ""
    }
    
    func clearStack () {
        clearResult()
        stack = []
    }
    
    func showResult () -> (String) {
        return result + "\(stack)"
    }
}
