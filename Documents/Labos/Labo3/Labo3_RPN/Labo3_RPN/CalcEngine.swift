//
//  CalcEngine.swift
//  Labo3_RPN
//
//  Created by Ilona Defevere on 08/10/2025.
//

import Foundation

@Observable class CalcEngine{
    var result: String
    var stack = [Double]()
    
    func addToStack (getal: Double) {
        stack[(stack.count) - 1] = getal
    }
    
    func calculateResult (operand: String) {
        
    }
    
    func clearResult () {
        stack = []
        result = ""
    }
    
    func showResult () {
        
    }
}
