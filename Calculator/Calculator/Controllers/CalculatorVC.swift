//
//  CalculatorVC.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var expression:String = "0"
    
    @IBOutlet weak var numericScreen: NumericScreen!{
        didSet{
            numericScreen.value = self.expression
        }
    }
    
    @IBOutlet weak var keyPad: Keypad!{
        didSet{
            self.keyPad.delegate = self
        }
    }

}

extension CalculatorVC: KeypadDelegate {
    
    func onKeyPressed(key: Key){
        self.expression = ExpressionUtils.sharedInstance.addKeyToExpression(key, expression: self.expression)
        
        if (key == Key.keyEqual && !ExpressionUtils.sharedInstance.isInitialExpression(self.expression)){
            self.expression = UseCase.sharedInstance.evaluate(self.expression)
        }
        self.numericScreen.value = self.expression
    }
}
