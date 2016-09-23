//
//  ExpressionUtils.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 22/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import Foundation

class ExpressionUtils {
    static let sharedInstance = ExpressionUtils()
    
    
    fileprivate init() {
    }
    
    
    func addKeyToExpression(_ key:Key,expression:String) -> String{
 
        var expressionToProcess = String(expression)
        
        if(self.isInitialExpression(expressionToProcess!)){
            if(key.isDigit){
                expressionToProcess = key.description
            }else if( key.rawValue == Key.keyPoint.rawValue ){
                expressionToProcess = expressionToProcess! + key.description
            }
        }else if(self.isInitialExpressionFollowedByOperator(expressionToProcess!)){
            if(key.isDigit){
                expressionToProcess = key.description
            }else if(key.rawValue == Key.keyAdd.rawValue || key.rawValue == Key.keySubstract.rawValue ){
                 expressionToProcess = Key.key0.description
            }else if( key.rawValue == Key.keyPoint.rawValue ){
                expressionToProcess = Key.key0.description + Key.keyPoint.description
            }
        }else if(self.isEndingWithOperator(expressionToProcess!)){
            if(key.isOperator  ){
                 expressionToProcess = self.replaceLastKeyIntoExpression(key, expression: expressionToProcess!)
            }else if(key.rawValue == Key.keyPoint.rawValue){
                 expressionToProcess = expressionToProcess! + Key.key0.description + Key.keyPoint.description
            }else{
                expressionToProcess = expressionToProcess! + key.description
            }
        }else if(self.isLastComponentInteger(expressionToProcess!)){
             expressionToProcess = expressionToProcess! + key.description
        }else if(self.isLastComponentReal(expression)){
            if(self.isEndingWithPoint(expressionToProcess!) &&
                (key.isOperator || key.rawValue == Key.keyPoint.rawValue )){
                 expressionToProcess = self.replaceLastKeyIntoExpression(key, expression: expressionToProcess!)
            }else  if(key.isDigit || key.isOperator){
                expressionToProcess = expressionToProcess! + key.description
            }
        }
        
        return expressionToProcess!;
    }
    
    func replaceLastKeyIntoExpression(_ key:Key,expression:String) -> String{
    
        return  String(expression.characters.dropLast()) + key.description;
    }

    
    func isInitialExpression(_ expression:String) -> Bool{
        return expression == "0";
    }

    func isInitialExpressionFollowedByOperator(_ expression:String) -> Bool{
        if (expression.characters.count==2){
            return expression.characters.first == "0" && (self.isEndingWithOperator(expression));
        }
        return false
    }
    
    func isLastComponentNatural(_ expression:String) -> Bool{
        
        return self.isNaturalComponent(self.getLastComponent(expression))
    }

    func isLastComponentInteger(_ expression:String) -> Bool{
        
        return self.isIntegerComponent(self.getLastComponent(expression))
    }
    
    func isLastComponentReal(_ expression:String) -> Bool{
        
        return self.isRealComponent(self.getLastComponent(expression))
    }
    
    func isEndingWithAdd(_ expression:String) -> Bool{
        return expression.characters.last == "+";
    }
    
    func isEndingWithSubstract(_ expression:String) -> Bool{
        return expression.characters.last == "-";
    }

    func isEndingWithPoint(_ expression:String) -> Bool{
        return expression.characters.last == ".";
    }
    
    func isEndingWithOperator(_ expression:String) -> Bool{
        return self.isEndingWithAdd(expression) || self.isEndingWithSubstract(expression)
    }
    
    func getLastComponent(_ expression:String) -> String{
        
        var component:String = ""
        
        for char in expression.characters.reversed() {
            if (char == "+" || char == "-"){
                break
            }
            component = "\(char)\(component)"
        }
        
        return component;
    }
    
    func isRealComponent(_ component:String) ->Bool{
        return self.isIntegerComponent(component) || (component.range(of: ".") != nil && component.characters.count > 1)
    }
    
    func isIntegerComponent(_ component:String) ->Bool{
          return self.isNaturalComponent(component) || (component.range(of: "-") != nil && component.range(of: ".") == nil && component.characters.count > 1)
    }
    
    func isNaturalComponent(_ component:String) ->Bool{
        let numberCharacters = CharacterSet.decimalDigits.inverted
        return !component.isEmpty && component.rangeOfCharacter(from: numberCharacters) == nil

    }
    
    
    func isDigitKey(_ key:Key)->Bool{
        return key.rawValue >= 0 && key.rawValue <= 9;
    }
    
    func isAddKey(_ key:Key)->Bool{
        return key == Key.keyAdd
    }
    
    
    func isSubstractKey(_ key:Key)->Bool{
        return key == Key.keySubstract
    }
    
    func isEqualKey(_ key:Key)->Bool{
        return key == Key.keyEqual
    }
    
    func isPointKey(_ key:Key)->Bool{
        return key == Key.keyPoint
    }
}
