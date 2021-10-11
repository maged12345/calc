//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var checkBoolean = true
   
    
    private var displayValue:Double {
        get {
            guard let number = Double(displayLabel.text!) else{
                       fatalError("current Title is equal to nil")
                   }
                   
            return number
        }
        set {
            displayLabel.text! = String(newValue)
        }
    }
 
    
    @IBOutlet weak var displayLabel: UILabel!
    
      private var calculate = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        
        checkBoolean = true
        calculate.setNumber(number: displayValue)
       
        if let currentTitile = sender.currentTitle {
            
            if let value = calculate.calculate(symbol: currentTitile) {
                displayValue = value
            }
            
        }
            
       
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
     //  let displayValue = Double(displayLabel.text!)!
        
        guard let currentTitle = sender.currentTitle else {
            fatalError("current Title of button  is equal to nil")
        }
        
        if checkBoolean {
            checkBoolean = false
            displayLabel.text! = currentTitle
        }else {
            
            if currentTitle == "." {
                guard let displayValue = Double( displayLabel.text!) else {
                    fatalError("Can't return to Double")
                }
                
                let isInt = floor(displayValue) == displayValue
                if !isInt {
                    return
                }
            }
            
            displayLabel.text! +=  currentTitle
            
        }
        
    
    }

}

