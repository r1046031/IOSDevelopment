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
    //enteredNumbers omdat stack wordt geupdate met het resultaat van de berekening
    var enteredNumbers = [Double]()
    
    //getal aan stack toevoegen
    func addToStack (getal: Double) {
        stack.append(getal)
        enteredNumbers.append(getal)
    }
    
    func calculateResult (operand: String) {
        //lengte controleren
        if stack.count >= 2 {
            //via poplast de waarden weghalen en in een variabele steken
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
            
            //de nieuwe berekening moet vooraan komen, dus daarvan '=' met op het einde '+ result'
            result = String(resultCalc) + "\n" + operand + "\n" + result
            addToStack(getal: resultCalc)
            //resultaat moest niet toegevoegd worden, dus hier pop ik hem
            enteredNumbers.popLast()
        } else {
            //errrormelding indien er niet genoeg waarden in de stack zitten voor een berekening te doen (stack.count >= 2)
            result = "Not enough operands..." + "\n" + operand + "\n" + result
        }
    }
    
    //twee aparte functies omdat soms enkel de tekst moet gecleart worden
    func clearResult () {
        result = ""
    }
    
    func clearStack () {
        clearResult()
        stack = []
        enteredNumbers = []
    }
    
    func showResult () -> (String) {
        return result + "\(enteredNumbers)"
    }
}
