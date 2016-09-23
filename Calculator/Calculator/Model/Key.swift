//
//  Key.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 23/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import Foundation

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
    case keyPoint
    
    var isDigit:Bool{
        return self.rawValue>=0 && self.rawValue<=9
    }
    
    var isOperator:Bool{
        return self.rawValue == Key.keyAdd.rawValue || self.rawValue == Key.keySubstract.rawValue
    }
    
    var description:String{
        if(self.isDigit){
            return String(self.rawValue)
        }else if(self.rawValue == Key.keyAdd.rawValue){
            return "+"
        }else if(self.rawValue == Key.keySubstract.rawValue){
            return "-"
        }else {
            return "."
        }
    }
}
