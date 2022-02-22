//
//  GherkinFormatters.swift
//  XCToolbox
//
//  Created by Mike Collins on 2/21/22.
//

import XCTest

public func given(_ description: String, _ closure: () -> Void) {
	runActivity("Given: \(description)", closure)
}

public func when(_ description: String, _ closure: () -> Void) {
	runActivity("When: \(description)", closure)
}

public func then(_ description: String, _ closure: () -> Void) {
	runActivity("Then: \(description)", closure)
}

public func and(_ description: String, _ closure: () -> Void) {
	runActivity("And: \(description)", closure)
}

private func runActivity(_ description: String, _ closure: () -> Void) {
	XCTContext.runActivity(named: description) { _  in
		closure()
	}
}
