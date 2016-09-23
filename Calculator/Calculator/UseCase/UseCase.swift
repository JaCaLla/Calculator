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
    
    fileprivate init() {
    }
    
    func evaluate(_ expression:String)->String{

        var expressionToEvaluate = String(expression)
        
        guard (expressionToEvaluate?.characters.count)! > 0 else{
            return "0";
        }
        
        if ExpressionUtils.sharedInstance.isEndingWithSubstract(expressionToEvaluate!) ||
           ExpressionUtils.sharedInstance.isEndingWithPoint(expressionToEvaluate!) ||
           ExpressionUtils.sharedInstance.isEndingWithAdd(expressionToEvaluate!) {
            expressionToEvaluate = expressionToEvaluate?.substring(to: (expressionToEvaluate?.characters.index(before: (expressionToEvaluate?.endIndex)!))!)
        }
        
        let result = NSExpression(format: expressionToEvaluate!).expressionValue(with: nil, context: nil) as! NSNumber
        
        return  String(result.stringValue)
    }
    

}
