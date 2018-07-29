//
//  TDLikertScaleSelectorUITests.swift
//  TDLikertScaleSelectorUITests
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import XCTest

class TDLikertScaleSelectorUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testButtonsExists() {
        let cell = XCUIApplication().tables.children(matching: .cell).element(boundBy: 1)
        let button1 = cell.buttons["strongly agree"]
        let button2 = cell.buttons["agree"]
        let button3 = cell.buttons["neutral"]
        let button4 = cell.buttons["disagree"]
        let button5 = cell.buttons["strongly disagree"]

        XCTAssertTrue(button1.exists)
        XCTAssertTrue(button2.exists)
        XCTAssertTrue(button3.exists)
        XCTAssertTrue(button4.exists)
        XCTAssertTrue(button5.exists)
    }
    
    
    func testButtonSelections() {
        let cell = XCUIApplication().tables.children(matching: .cell).element(boundBy: 1)
        let button1 = cell.buttons["strongly agree"]
        let button2 = cell.buttons["agree"]
        let button3 = cell.buttons["neutral"]
        let button4 = cell.buttons["disagree"]
        let button5 = cell.buttons["strongly disagree"]
        
        XCTAssertFalse(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        XCTAssertFalse(button4.isSelected)
        XCTAssertFalse(button5.isSelected)

        button1.tap()
        XCTAssertTrue(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        XCTAssertFalse(button4.isSelected)
        XCTAssertFalse(button5.isSelected)
        
        button2.tap()
        XCTAssertFalse(button1.isSelected)
        XCTAssertTrue(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        XCTAssertFalse(button4.isSelected)
        XCTAssertFalse(button5.isSelected)
        
        button3.tap()
        XCTAssertFalse(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertTrue(button3.isSelected)
        XCTAssertFalse(button4.isSelected)
        XCTAssertFalse(button5.isSelected)
        
        button4.tap()
        XCTAssertFalse(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        XCTAssertTrue(button4.isSelected)
        XCTAssertFalse(button5.isSelected)
        
        button5.tap()
        XCTAssertFalse(button1.isSelected)
        XCTAssertFalse(button2.isSelected)
        XCTAssertFalse(button3.isSelected)
        XCTAssertFalse(button4.isSelected)
        XCTAssertTrue(button5.isSelected)
    }
}
