//
//  XCTestCase+Extensions.swift
//  XCToolbox
//
//  Created by Mike Collins on 2/27/22.
//

extension XCTestCase {

    func takeScreenshot(named: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        attachment.name = named
        add(attachment)
    }
}
