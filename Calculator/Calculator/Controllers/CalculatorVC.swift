//
//  CalculatorVC.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    var expression:String = ""
    
    @IBOutlet weak var numericScreen: NumericScreen!{
        didSet{
            numericScreen.value = "0"
        }
    }
    
    @IBOutlet weak var keyPad: Keypad!{
        didSet{
            keyPad.onKeyPress = {
                key in
                
                switch key {
                case Key.key0:
                    self.expression += "0"
                case Key.key1:
                    self.expression += "1"
                case Key.key2:
                    self.expression += "2"
                case Key.key3:
                    self.expression += "3"
                case Key.key4:
                    self.expression += "4"
                case Key.key5:
                    self.expression += "5"
                case Key.key6:
                    self.expression += "6"
                case Key.key7:
                    self.expression += "7"
                case Key.key8:
                    self.expression += "8"
                case Key.key9:
                    self.expression += "9"
                case Key.keyAdd:
                    self.expression += "+"
                case Key.keySubstract:
                    self.expression += "-"
                case Key.keyPoint:
                    self.expression += "."
                default:
                    break
                }
                
                if (key == Key.keyEqual){
                    self.expression = String(UseCase.sharedInstance.evaluate(self.expression))
                }
                self.numericScreen.value = self.expression
            }
            
            
            
        }
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK :  Private
    

}
