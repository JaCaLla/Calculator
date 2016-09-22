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
    
    func clean(){
        self.lastValue = "0+"
    }
    
    func evaluate(expression:String)->Double{

        var expressionToEvaluate = String(expression)
        
        guard expressionToEvaluate.characters.count > 0 else{
            return 0;
        }
        
        if ExpressionUtils.sharedInstance.isEndingWithSubstract(expressionToEvaluate) ||
           ExpressionUtils.sharedInstance.isEndingWithPoint(expressionToEvaluate) ||
           ExpressionUtils.sharedInstance.isEndingWithAdd(expressionToEvaluate) {
            expressionToEvaluate = expressionToEvaluate.substringToIndex(expressionToEvaluate.endIndex.predecessor())
        }
        
        let result = NSExpression(format: "\(self.lastValue)" + expressionToEvaluate).expressionValueWithObject(nil, context: nil) as! NSNumber
        
        self.lastValue = String(result.stringValue)
        
        return result.doubleValue

    }
    

}