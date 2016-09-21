//
//  CalculatorVC.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    
    @IBOutlet weak var numericScreen: NumericScreen!{
        didSet{
            numericScreen.onKeyPress = {
                key in
                
            }
            
            numericScreen.backgroundColor = UIColor.redColor()
        }
    }
    
    @IBOutlet weak var keyPad: Keypad!
    
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
