//
//  NumericScreen.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import UIKit

enum Key: Int {
    case key0 = 0
    case key1
    case key2
    case key3
    case key4
    case key5
    case key6
    case key7
    case key8
    case key9
    case keyAdd
    case keySubstract
    case keyEqual
}

class NumericScreen: UIView {
    var onKeyPress: ((Key) -> Void)?
    
    
    
}
