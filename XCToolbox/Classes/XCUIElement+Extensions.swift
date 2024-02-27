//
//  XCUIElement+Extensions.swift
//  XCToolbox
//
//  Created by Mike Collins on 2/21/22.
//

import XCTest

extension XCUIElement {
	
// TAPPING
	
	// Taps the 0,0 screen cooridnate of an element, regardless of what may exist above it
	public func forceTap() {
		coordinate(withNormalizedOffset: CGVector(dx: 0.0, dy: 0.0)).tap()
	}
	
	public func tapIfExists() {
		if exists { tap() }
	}
	
	// Taps the current element until a specified element is hittable.
	// Useful for invoking the springboard in a textfield as the number of taps required can differ by device.
	public func tapUntilElementHittable(element: XCUIElement) {
		let maxRetries = 3
		let retry = 0
		while(!element.isHittable && retry < maxRetries) {
			tap()
		}
	}
	
// PASTING
	
	// Reliably pastes text into a field.
	// The springboard can cause flakiness if it doesn't get out of the way quickly enough. This ensure it does.
	public func pasteInto(string: String) {
		let pasteButton = XCUIApplication().menuItems["Paste"]
		UIPasteboard.general.string = string
		waitForSpringboardToDisappear()
		tapUntilElementHittable(element: pasteButton)
		pasteButton.tap()
		waitForSpringboardToDisappear()
	}
	
	private func waitForSpringboardToDisappear() {
		_ = XCUIApplication(bundleIdentifier: "com.apple.springboard").staticTexts.firstMatch.waitForDisappearance()
	}
	
// WAITS
	
	// Waits for an element to disappear
	public func waitForDisappearance(timeout: TimeInterval = Waits.short.rawValue) -> Bool {
		let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: UIStatus.notExist.rawValue), object: self)
		let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
		switch result {
		case .completed:
			return true
		default:
			return false
		}
	}
	
	// Waits for an element to be hittable
	public func waitForHittable(timeout: TimeInterval = Waits.short.rawValue) -> Bool {
		let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: UIStatus.hittable.rawValue), object: self)
		let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
		switch result {
		case .completed:
			return true
		default:
			return false
		}
	}
	
	// Waits for a switch to change value - toggling switches can be flaky otherwise
    public func waitForSwitchValue(_ expectation: Bool, timeout: TimeInterval = Waits.short.rawValue) -> Bool {
        let value = (self.value as! NSString).boolValue
        var timerTicks: Double = 0.0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in timerTicks += 1.0
            if value == expectation || timerTicks >= timeout {
                timer.invalidate()
            }
        }
        return value == expectation
    }

	// Waits for a value to no longer contain a string
    public func waitForValueToNotContain(this containing: String, timeout: TimeInterval = Waits.extraLong.rawValue) {
		let value = self.value as! String
        var timerTicks: Double = 0.0
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in timerTicks += 1.0
			if (!value.contains(containing)) || timerTicks >= timeout {
				timer.invalidate()
			}
		}
	}
}
