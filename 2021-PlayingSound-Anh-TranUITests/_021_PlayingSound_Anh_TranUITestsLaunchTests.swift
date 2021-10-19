//
//  _021_PlayingSound_Anh_TranUITestsLaunchTests.swift
//  2021-PlayingSound-Anh-TranUITests
//
//  Created by Anh Tran on 10/19/21.
//

import XCTest

class _021_PlayingSound_Anh_TranUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
