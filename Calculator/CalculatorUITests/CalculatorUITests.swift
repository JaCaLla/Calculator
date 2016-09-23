//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by JAVIER CALATRAVA LLAVERIA on 21/09/16.
//  Copyright © 2016 JAVIER CALATRAVA LLAVERIA. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_KeysPrintedInCalculatorScreen() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.buttons["btnKey1"].tap()
        app.buttons["btnKey0"].tap()
        app.buttons["btnKey2"].tap()
        app.buttons["btnKeyAdd"].tap()
        app.buttons["btnKey3"].tap()
        app.buttons["btnKey4"].tap()
        app.buttons["btnKey5"].tap()
        app.buttons["btnKeySubstract"].tap()
        app.buttons["btnKey6"].tap()
        app.buttons["btnKey7"].tap()
        app.buttons["btnKeySubstract"].tap()
        app.buttons["btnKey8"].tap()
        app.buttons["btnKey9"].tap()
        app.buttons["btnKeyPoint"].tap()
        app.buttons["btnKey5"].tap()
        
        let lblValue = app.staticTexts["lblValue"]
        XCTAssertEqual(lblValue.label,"102+345-67-89.5")
        
        app.buttons["btnKeyEqual"].tap()
        XCTAssertEqual(lblValue.label,"290.5")
        
    }
    
}
