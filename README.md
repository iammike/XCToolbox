# XCToolbox

[![Version](https://img.shields.io/cocoapods/v/XCToolbox.svg?style=flat)](https://cocoapods.org/pods/XCToolbox)
[![License](https://img.shields.io/cocoapods/l/XCToolbox.svg?style=flat)](https://cocoapods.org/pods/XCToolbox)
[![Platform](https://img.shields.io/cocoapods/p/XCToolbox.svg?style=flat)](https://cocoapods.org/pods/XCToolbox)

## Requirements

Xcode and iOS version >= 10.0

## Installation

XCToolbox is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XCToolbox'
```

## What's in the Box

### Gherkin Formatting

By default, the output/logging from XCUITests are difficult to parse. This provides "activity" naming in given/when/then/and format to provide more readable results and test organization.

Usage:
```
func testGoMakesMeGo() {
  given("I launch my app") {
    XCUIApplication().launch()
  }
  
  when("I tap the Go button") {
    XCUIApplication().buttons["Go"]
  }
     
  then("I should see I have gone") {
    XCTAssertTrue(XCUIApplication().staticTexts["You have gone!"].exists)
  }
}
```

### UIStatus

A set of strings to use when building expectations with predicates.

- `exist`/`notExist`
- `selected`/`notSelected`
- `hittable`/`notHittable`

Usage: `NSPredicate(format: UIStatus.notExist.rawValue)`

### Waits

A set of TimeIntervals to use when waiting.

- `short` (2 seconds)
- `medium` (5 seconds)
- `long` (10 seconds)
- `extraLong` (20 seconds)

Usage: `someLoadingData.waitForExistence(timeout: Waits.long.rawValue)`

### XCUIElement Extensions

`forceTap()` Ignores the restrictions tap() is bound by and taps the element anyway  
`pasteInto(toPaste: String)` Reliably uses the Pasteboard to copy text into an element  
`waitForDisappearance(timeout: TimeInterval) -> Bool` Waits for an element to disappear  
`waitForHittable(timeout: TimeInterval) -> Bool` Waits for an element to be hittable  
`waitForSwitchValue(expectation: Bool, timeout: Int) -> Bool` Waits for a switch to change value (can be useful if you navigate away immediately after tapping it)  
`waitForValueToNotContain(this: String, timeout: Int)` Waits for a value to no longer contain a string  

### XCUIElementQuery Extensions

`allValues: [String]` Contains all string label values from a query  
`lastMatch: XCUIElement` The last matching element in a query  
`secondMatch: XCUIElement` The second matching element in a query  
`thirdMatch: XCUIElement` The third matching element in a query  
`nthMatch(n: Int) -> XCUIElement` Returns the "nth" matching element in a query  
Note: `firstMatch` is provided by XCTest  

## Author

Mike Collins, mike@iammike.org

## License

XCToolbox is available under the MIT license. See the LICENSE file for more info.
