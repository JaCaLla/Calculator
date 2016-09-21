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
    
    private init() {
    }
    
    func evaluate(expression:String)->Int{

        guard expression.characters.count > 0 else{
            return 0;
        }
        
        let result = NSExpression(format: expression).expressionValueWithObject(nil, context: nil) as! NSNumber
        
        return result.integerValue

    }
}