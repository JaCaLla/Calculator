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
    
    
    private init() {
    }
    
    
    func addKeyToExpression(key:Key,expression:String) -> String{
 
        var expressionToProcess = String(expression)
        
        if(self.isInitialExpression(expressionToProcess)){
            if(key.isDigit){
                expressionToProcess = key.description
            }else if( key.rawValue == Key.keyPoint.rawValue ){
                expressionToProcess += key.description
            }
        }else if(self.isInitialExpressionFollowedByOperator(expressionToProcess)){
            if(key.isDigit){
                expressionToProcess = key.description
            }else if(key.rawValue == Key.keyAdd.rawValue || key.rawValue == Key.keySubstract.rawValue ){
                 expressionToProcess = "0"
            }else if( key.rawValue == Key.keyPoint.rawValue ){
                expressionToProcess = "0."
            }
        }else if(self.isEndingWithOperator(expressionToProcess)){
            if(key.isOperator  ){
                 expressionToProcess = self.replaceLastKeyIntoExpression(key, expression: expressionToProcess)
            }else if(key.rawValue == Key.keyPoint.rawValue){
                 expressionToProcess += "0."
            }else{
                expressionToProcess += key.description
            }
        }else if(self.isLastComponentInteger(expressionToProcess)){
             expressionToProcess += key.description
        }else if(self.isLastComponentReal(expression)){
            if(self.isEndingWithPoint(expressionToProcess) &&
                (key.isOperator || key.rawValue == Key.keyPoint.rawValue )){
                 expressionToProcess = self.replaceLastKeyIntoExpression(key, expression: expressionToProcess)
            }else  if(key.isDigit || key.isOperator){
                expressionToProcess += key.description
            }
        }
        
        return expressionToProcess;
    }
    
    func replaceLastKeyIntoExpression(key:Key,expression:String) -> String{

        var expressionToProcess = String(expression.characters.dropLast())
        
        switch key {
        case Key.key0:
            expressionToProcess += "0"
        case Key.key1:
            expressionToProcess += "1"
        case Key.key2:
            expressionToProcess += "2"
        case Key.key3:
            expressionToProcess += "3"
        case Key.key4:
            expressionToProcess += "4"
        case Key.key5:
            expressionToProcess += "5"
        case Key.key6:
            expressionToProcess += "6"
        case Key.key7:
            expressionToProcess += "7"
        case Key.key8:
            expressionToProcess += "8"
        case Key.key9:
            expressionToProcess += "9"
        case Key.keyAdd:
            expressionToProcess += "+"
        case Key.keySubstract:
            expressionToProcess += "-"
        case Key.keyPoint:
            expressionToProcess += "."
        default:
            break
        }
        
        return expressionToProcess;
    }
    /*
    func isValidKeyForExpression(key:Key,expression:String) -> Bool {
        
        if((self.isEndingWithPoint(expression) && self.isPointKey(key))){
            return false
        }
       
        if(self.isInitialExpression(expression)){
            return self.isDigitKey(key)  || self.isPointKey(key) || self.isEqualKey(key) || self.isAddKey(key) || self.isSubstractKey(key)
        }else if(self.isInitialExpressionFollowedByOperator(expression)){
            return self.isDigitKey(key)  || self.isPointKey(key) || self.isEqualKey(key) || self.isAddKey(key) || self.isSubstractKey(key)
        }else if(self.isLastComponentNatural(expression)){
            return self.isDigitKey(key)  || self.isPointKey(key) || self.isEqualKey(key) || self.isAddKey(key) || self.isSubstractKey(key)
        }else if(self.isLastComponentInteger(expression)){
            return self.isDigitKey(key)  || self.isPointKey(key) || self.isEqualKey(key) || self.isAddKey(key) || self.isSubstractKey(key)
        }else if(self.isLastComponentReal(expression)){
            return self.isDigitKey(key)  || self.isEqualKey(key) || self.isAddKey(key) || self.isSubstractKey(key)
        }else if(self.isEndingWithOperator(expression)){
            return  self.isAddKey(key) || self.isSubstractKey(key)
        }
    
        return false
    }
    */

    
    func isInitialExpression(expression:String) -> Bool{
        return expression == "0";
    }

    func isInitialExpressionFollowedByOperator(expression:String) -> Bool{
        if (expression.characters.count==2){
            return expression.characters.first == "0" && (self.isEndingWithOperator(expression));
        }
        return false
    }
    
    func isLastComponentNatural(expression:String) -> Bool{
        
        return self.isNaturalComponent(self.getLastComponent(expression))
    }

    func isLastComponentInteger(expression:String) -> Bool{
        
        return self.isIntegerComponent(self.getLastComponent(expression))
    }
    
    func isLastComponentReal(expression:String) -> Bool{
        
        return self.isRealComponent(self.getLastComponent(expression))
    }
    
    func isExpressionEndedWithNaturalNumber(expression:String) -> Bool{
        
        return expression == "0";
    }
    
    func isEndingWithAdd(expression:String) -> Bool{
        return expression.characters.last == "+";
    }
    
    func isEndingWithSubstract(expression:String) -> Bool{
        return expression.characters.last == "-";
    }

    func isEndingWithPoint(expression:String) -> Bool{
        return expression.characters.last == ".";
    }
    
    func isEndingWithOperator(expression:String) -> Bool{
        return self.isEndingWithAdd(expression) || self.isEndingWithSubstract(expression)
    }
    
    func getLastComponent(expression:String) -> String{
        
        var component:String = ""
        
        for char in expression.characters.reverse() {
            if (char == "+" || char == "-"){
                break
            }
            component = "\(char)\(component)"
        }
        
        return component;
    }
    
    func isRealComponent(component:String) ->Bool{
        return self.isIntegerComponent(component) || (component.rangeOfString(".") != nil && component.characters.count > 1)
    }
    
    func isIntegerComponent(component:String) ->Bool{
          return self.isNaturalComponent(component) || (component.rangeOfString("-") != nil && component.rangeOfString(".") == nil && component.characters.count > 1)
    }
    
    func isNaturalComponent(component:String) ->Bool{
        let numberCharacters = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        return !component.isEmpty && component.rangeOfCharacterFromSet(numberCharacters) == nil

    }
    
    
    func isDigitKey(key:Key)->Bool{
        return key.rawValue >= 0 && key.rawValue <= 9;
    }
    
    func isAddKey(key:Key)->Bool{
        return key == Key.keyAdd
    }
    
    
    func isSubstractKey(key:Key)->Bool{
        return key == Key.keySubstract
    }
    
    func isEqualKey(key:Key)->Bool{
        return key == Key.keyEqual
    }
    
    func isPointKey(key:Key)->Bool{
        return key == Key.keyPoint
    }
}