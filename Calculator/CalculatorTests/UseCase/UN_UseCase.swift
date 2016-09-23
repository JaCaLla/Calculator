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
        XCTAssertEqual(UseCase.sharedInstance.evaluate(""),"0")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("12+65-7"),"70")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("70+16-2"),"84")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("84-4-2"),"78")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-"),"0")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-1."),"-1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-1+"),"-1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+"),"0")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-"),"0")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+1"),"1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2"),"-2")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+13"),"13")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-24"),"-24")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+1."),"1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2."),"-2")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+1.1"),"1.1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2.2"),"-2.2")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+1.1+"),"1.1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2.2+"),"-2.2")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+1.1-"),"1.1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2.2-"),"-2.2")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2.2-2"),"-4.2")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+1.1+10"),"11.1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2.2+20"),"17.8")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2.2-2-"),"-4.2")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0+1.1+10."),"11.1")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("0-2.2+20+0.2"),"18")
        XCTAssertEqual(UseCase.sharedInstance.evaluate("102+345-67-89.5"),"290.5")
        
    }
    
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
