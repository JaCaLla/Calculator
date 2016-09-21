//
//  UseCase.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import Foundation

class UseCase {
    static let sharedInstance = UseCase()
    
    var lastValue:String = "0+"
    
    private init() {
    }
    
    func evaluate(expression:String)->Int{

        guard expression.characters.count > 0 else{
            return 0;
        }
        
        let result = NSExpression(format: "\(self.lastValue)" + expression).expressionValueWithObject(nil, context: nil) as! NSNumber
        
        self.lastValue = String(result.stringValue)
        
        return result.integerValue

    }
}