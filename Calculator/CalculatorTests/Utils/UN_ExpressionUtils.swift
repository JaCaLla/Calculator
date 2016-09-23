//
//  UN_ExpressionUtils.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 22/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import XCTest

@testable import Calculator;

class UN_ExpressionUtils: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_addKeyToExpression(){
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.key1, expression: "0"),"1")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyPoint, expression: "0"),"0.")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0"),"0")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0"),"0")
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.key1, expression: "0+"),"1")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyPoint, expression: "0+"),"0.")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0+"),"0")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0-"),"0")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0+"),"0")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0-"),"0")
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.key1, expression: "0+1"),"0+11")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyPoint, expression: "0+1"),"0+1.")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0+1"),"0+1+")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0-1"),"0-1+")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0+1"),"0+1-")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0-1"),"0-1-")
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.key1, expression: "0+1."),"0+1.1")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyPoint, expression: "0+1."),"0+1.")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0+1."),"0+1+")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0-1."),"0-1+")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0+1."),"0+1-")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0-1."),"0-1-")
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.key1, expression: "0+1.2"),"0+1.21")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyPoint, expression: "0+1.2"),"0+1.2")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0+1.2"),"0+1.2+")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0-1.2"),"0-1.2+")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0+1.2"),"0+1.2-")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0-1.2"),"0-1.2-")

        
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.key1, expression: "0+1.2+"),"0+1.2+1")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyPoint, expression: "0+1.2-"),"0+1.2-0.")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0+1.2+"),"0+1.2+")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keyAdd, expression: "0-1.2-"),"0-1.2+")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0+1.2+"),"0+1.2-")
        XCTAssertEqual(ExpressionUtils.sharedInstance.addKeyToExpression(Key.keySubstract, expression: "0-1.2-"),"0-1.2-")
    }
    
    func test_replaceLastKeyIntoExpression(){
       XCTAssertEqual(ExpressionUtils.sharedInstance.replaceLastKeyIntoExpression(Key.keySubstract, expression: "0+"), "0-");
       XCTAssertEqual(ExpressionUtils.sharedInstance.replaceLastKeyIntoExpression(Key.keyAdd, expression: "0-"), "0+");
    }
    
    func test_isInitialExpression() {
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpression(""),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpression("1"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpression("0"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpression("0+"),false)
        
    }
    
    func test_isInitialExpressionFollowedByOperator(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpressionFollowedByOperator(""),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpressionFollowedByOperator("1"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpressionFollowedByOperator("0"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpressionFollowedByOperator("0+"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isInitialExpressionFollowedByOperator("0-"),true)
    }
    
    func test_isLastComponentNatural(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("12+"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("1-"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("0."),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("12-23."),false)
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("12"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("12-3"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("12-31"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("12+3"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentNatural("12+31"),true)
    }
    
    func test_isLastComponentInteger(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("12+"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("1-"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("0."),false)
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("12-23."),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("12"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("12-3"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("12-31"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("12+3"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentInteger("12+31"),true)
    }

    func test_isLastComponentReal(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12+"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("1-"),false)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("0."),true)
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12-23."),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12-3"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12-31"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12+3"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12+31"),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12+31."),true)
        XCTAssertEqual(ExpressionUtils.sharedInstance.isLastComponentReal("12+31.6"),true)
    }
    
    func test_isEndingWithAdd(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithAdd(""),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithAdd("-"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithAdd("+"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithAdd("12+58+"),true);
    }
    
    func test_isEndingWithSubstract(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithSubstract(""),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithSubstract("-"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithSubstract("2-"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithSubstract("+"),false);
    }
    
    func test_isEndingWithPoint(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithPoint(""),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithPoint("."),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithPoint("2."),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithPoint("+"),false);
    }
    
    func test_isEndingWithOperator(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithOperator(""),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithOperator("-"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithOperator("+"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEndingWithOperator("*"),false);
    }
    
    func test_getLastComponent(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("0"),"0");
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("1"),"1");
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("12"),"12");
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("123"),"123");
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("123+"),"");
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("123-"),"");
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("123-1."),"1.");
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("123-12."),"12.");
        XCTAssertEqual(ExpressionUtils.sharedInstance.getLastComponent("123-12.4"),"12.4");
    }
    
    func test_isRealComponent(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isRealComponent("-"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isRealComponent("."),false);
        
        XCTAssertEqual(ExpressionUtils.sharedInstance.isRealComponent(".1"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isRealComponent("-1."),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isRealComponent("-5"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isRealComponent("5"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isRealComponent("5.2"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isRealComponent("-0.5"),true);
    }
    
    func test_isIntegerComponent(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent(""),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent("-"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent("."),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent(".1"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent("-1."),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent("5.2"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent("-0.5"),false);
 
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent("-5"),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isIntegerComponent("5"),true);
    }
    
    func test_isNaturalComponent(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent(""),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent("-"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent("."),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent(".1"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent("-1."),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent("-5"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent("5.2"),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent("-0.5"),false);

        XCTAssertEqual(ExpressionUtils.sharedInstance.isNaturalComponent("5"),true);

    }
    
    func test_isDigitKey(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key0),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key1),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key2),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key3),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key4),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key5),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key6),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key7),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key8),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.key9),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.keyAdd),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.keySubstract),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.keyEqual),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isDigitKey(Key.keyPoint),false);
    }

    func test_isAddKey(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key0),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key1),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key2),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key3),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key4),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key5),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key6),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key7),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key8),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.key9),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.keyAdd),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.keySubstract),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.keyEqual),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isAddKey(Key.keyPoint),false);
    }
    
    func test_isSubstractKey(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key0),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key1),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key2),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key3),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key4),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key5),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key6),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key7),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key8),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.key9),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.keyAdd),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.keySubstract),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.keyEqual),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isSubstractKey(Key.keyPoint),false);
    }
    
    func test_isEqualKey(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key0),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key1),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key2),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key3),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key4),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key5),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key6),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key7),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key8),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.key9),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.keyAdd),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.keySubstract),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.keyEqual),true);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isEqualKey(Key.keyPoint),false);
    }
    
    func test_isPointKey(){
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key0),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key1),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key2),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key3),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key4),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key5),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key6),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key7),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key8),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.key9),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.keyAdd),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.keySubstract),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.keyEqual),false);
        XCTAssertEqual(ExpressionUtils.sharedInstance.isPointKey(Key.keyPoint),true);
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
