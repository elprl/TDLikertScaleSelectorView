//
//  TDLikertScaleSelectorTests.swift
//  TDLikertScaleSelectorTests
//
//  Created by Paul Leo on 27/07/2018.
//  Copyright © 2018 tapdigital Ltd. All rights reserved.
//

import XCTest
@testable import TDLikertScaleSelectorView

class TDLikertScaleSelectorViewTests: XCTestCase {
    let viewClass = TDLikertScaleSelectorView()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewIsUI() {
        XCTAssert(viewClass.isKind(of: UIView.self))
    }

    func testLikertCategories() {
        XCTAssertEqual(TDSelectionCategory.allCases.count, 5, "has the 5 selection cases")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
