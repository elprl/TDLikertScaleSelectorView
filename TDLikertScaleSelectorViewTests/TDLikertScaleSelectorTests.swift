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
    
    func testLocalizedName() {
        XCTAssertEqual(TDSelectionCategory.stronglyAgree.localizedName, "strongly agree", "has the correct name")
        XCTAssertEqual(TDSelectionCategory.agree.localizedName, "agree", "has the correct name")
        XCTAssertEqual(TDSelectionCategory.neutral.localizedName, "neutral", "has the correct name")
        XCTAssertEqual(TDSelectionCategory.disagree.localizedName, "disagree", "has the correct name")
        XCTAssertEqual(TDSelectionCategory.stronglyDisagree.localizedName, "strongly disagree", "has the correct name")
    }
    
    func testOptionOrder() {
        XCTAssertEqual(TDSelectionCategory.stronglyAgree.rawValue, 0, "has the correct name")
        XCTAssertEqual(TDSelectionCategory.agree.rawValue, 1, "has the correct name")
        XCTAssertEqual(TDSelectionCategory.neutral.rawValue, 2, "has the correct name")
        XCTAssertEqual(TDSelectionCategory.disagree.rawValue, 3, "has the correct name")
        XCTAssertEqual(TDSelectionCategory.stronglyDisagree.rawValue, 4, "has the correct name")
    }
}
