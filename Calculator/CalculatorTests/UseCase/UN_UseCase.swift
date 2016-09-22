//
//  UN_UseCase.swift
//  Calculator
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import XCTest

@testable import Calculator;

class UN_UseCase: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_evaluate() {
        UseCase.sharedInstance.clean()
        XCTAssertEqual(UseCase.sharedInstance.evaluate(""),Double(0));
        XCTAssertEqual(UseCase.sharedInstance.evaluate("12+65-7"),Double(70))
        XCTAssertEqual(UseCase.sharedInstance.evaluate("+16-2"),Double(84))
        XCTAssertEqual(UseCase.sharedInstance.evaluate("-4-2"),Double(78))
        UseCase.sharedInstance.clean()
        XCTAssertEqual(UseCase.sharedInstance.evaluate(""),Double(0));
        XCTAssertEqual(UseCase.sharedInstance.evaluate("12+65-7"),Double(70))
        XCTAssertEqual(UseCase.sharedInstance.evaluate("+16-2"),Double(84))
        XCTAssertEqual(UseCase.sharedInstance.evaluate("-4-2"),Double(78))
        
        UseCase.sharedInstance.clean()
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-"),Double(0))
        
        UseCase.sharedInstance.clean()
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-1."),Double(-1))

        UseCase.sharedInstance.clean()
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-1+"),Double(-1))
        
    }
    
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
