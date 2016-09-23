//
//  UN_Keypad.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 23/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import XCTest

@testable import Calculator;

class UN_Keypad: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_isDigit() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Key.key0.isDigit, true)
        XCTAssertEqual(Key.key1.isDigit, true)
        XCTAssertEqual(Key.key2.isDigit, true)
        XCTAssertEqual(Key.key3.isDigit, true)
        XCTAssertEqual(Key.key4.isDigit, true)
        XCTAssertEqual(Key.key5.isDigit, true)
        XCTAssertEqual(Key.key6.isDigit, true)
        XCTAssertEqual(Key.key7.isDigit, true)
        XCTAssertEqual(Key.key8.isDigit, true)
        XCTAssertEqual(Key.key9.isDigit, true)
        XCTAssertEqual(Key.keyAdd.isDigit, false)
        XCTAssertEqual(Key.keySubstract.isDigit, false)
        XCTAssertEqual(Key.keyPoint.isDigit, false)
        XCTAssertEqual(Key.keyEqual.isDigit, false)
    }
    
    func test_isOperator() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Key.key0.isOperator, false)
        XCTAssertEqual(Key.key1.isOperator, false)
        XCTAssertEqual(Key.key2.isOperator, false)
        XCTAssertEqual(Key.key3.isOperator, false)
        XCTAssertEqual(Key.key4.isOperator, false)
        XCTAssertEqual(Key.key5.isOperator, false)
        XCTAssertEqual(Key.key6.isOperator, false)
        XCTAssertEqual(Key.key7.isOperator, false)
        XCTAssertEqual(Key.key8.isOperator, false)
        XCTAssertEqual(Key.key9.isOperator, false)
        XCTAssertEqual(Key.keyAdd.isOperator, true)
        XCTAssertEqual(Key.keySubstract.isOperator, true)
        XCTAssertEqual(Key.keyPoint.isOperator, false)
        XCTAssertEqual(Key.keyEqual.isOperator, false)
    }
    
    func test_description(){
        XCTAssertEqual(Key.key0.description, "0")
        XCTAssertEqual(Key.key1.description, "1")
        XCTAssertEqual(Key.key2.description, "2")
        XCTAssertEqual(Key.key3.description, "3")
        XCTAssertEqual(Key.key4.description, "4")
        XCTAssertEqual(Key.key5.description, "5")
        XCTAssertEqual(Key.key6.description, "6")
        XCTAssertEqual(Key.key7.description, "7")
        XCTAssertEqual(Key.key8.description, "8")
        XCTAssertEqual(Key.key9.description, "9")
        XCTAssertEqual(Key.keyAdd.description, "+")
        XCTAssertEqual(Key.keySubstract.description, "-")
        XCTAssertEqual(Key.keyPoint.description, ".")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
