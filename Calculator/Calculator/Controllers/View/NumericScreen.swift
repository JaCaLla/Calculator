//
//  NumericScreen.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

class NumericScreen: UIView {
    
    var value:String = "0"{
        didSet{
            lblValue.text=value
        }
    }
 
    @IBOutlet private weak var lblValue: UILabel!
    
    
}
