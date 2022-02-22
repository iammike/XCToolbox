//
//  XCUIElementQuery+Extensions.swift
//  XCToolbox
//
//  Created by Mike Collins on 2/21/22.
//

import XCTest

extension XCUIElementQuery {
	
	var allValues: [String] {
		let elements = allElementsBoundByIndex
		var values = [String]()
		
		for element in elements {
			values.append(element.label)
		}
		return values
	}
	
	var lastMatch: XCUIElement {
		return element(boundBy: self.count - 1)
	}
	
	var secondMatch: XCUIElement {
		return nthMatch(2)
	}
	
	var thirdMatch: XCUIElement {
		return nthMatch(3)
	}
	
	func nthMatch(_ number: Int) -> XCUIElement {
		return element(boundBy: number-1)
	}
}
