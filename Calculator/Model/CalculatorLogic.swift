//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by majid mohmed on 9/8/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {

    private var number:Double?
    
    private var MyTubles : (n1:Double, operation:String)?
    
    mutating  func setNumber(number:Double?)  {
          self.number = number
      }
      
   mutating func calculate (symbol:String) -> Double? {
         if let n =  number {
        switch symbol  {
            case "+/-":
                return   n * -1
        case "AC" :
                return     0
        case "%":
            return  n * 0.01
        case "=" :
                  return calcuMethod(n2: n)
        default :
                MyTubles = (n1:n, operation:symbol)
           
                 }
                
                
                }
            
        return nil
                  
    }
    
    func calcuMethod(n2:Double) -> Double? {
        if let n1 = MyTubles?.n1 ,let op = MyTubles?.operation {
            switch MyTubles?.operation {
                       case "+":
                           return n1 + n2
                       
                       case "-":
                       return n1 - n2
                       
                       case "×":
                       return n1 * n2
                       
                       case "÷":
                       return n1 / n2
                   default:
                      fatalError("Error Math")
                   }
        }
       return nil
    }
}
