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
    
    func evaluate(expression:String)->String{

        var expressionToEvaluate = String(expression)
        
        guard expressionToEvaluate.characters.count > 0 else{
            return "0";
        }
        
        if ExpressionUtils.sharedInstance.isEndingWithSubstract(expressionToEvaluate) ||
           ExpressionUtils.sharedInstance.isEndingWithPoint(expressionToEvaluate) ||
           ExpressionUtils.sharedInstance.isEndingWithAdd(expressionToEvaluate) {
            expressionToEvaluate = expressionToEvaluate.substringToIndex(expressionToEvaluate.endIndex.predecessor())
        }
        
        let result = NSExpression(format: expressionToEvaluate).expressionValueWithObject(nil, context: nil) as! NSNumber
        
        return  String(result.stringValue)
    }
    

}