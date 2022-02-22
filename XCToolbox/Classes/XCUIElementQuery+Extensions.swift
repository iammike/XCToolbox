//
//  XCUIElementQuery+Extensions.swift
//  XCToolbox
//
//  Created by Mike Collins on 2/21/22.
//

import XCTest

extension XCUIElementQuery {
	
	public var allValues: [String] {
		let elements = allElementsBoundByIndex
		var values = [String]()
		
		for element in elements {
			values.append(element.label)
		}
		return values
	}
	
	public var lastMatch: XCUIElement {
		return element(boundBy: self.count - 1)
	}
	
	public var secondMatch: XCUIElement {
		return nthMatch(2)
	}
	
	public var thirdMatch: XCUIElement {
		return nthMatch(3)
	}
	
	public func nthMatch(_ number: Int) -> XCUIElement {
		return element(boundBy: number-1)
	}
}
