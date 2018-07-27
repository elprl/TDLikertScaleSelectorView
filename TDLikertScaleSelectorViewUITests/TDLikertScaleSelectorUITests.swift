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


    func testUIExists() {
        XCTAssert(app.staticTexts["TDLikertScaleSelectorView"].exists)
        
    }
}
