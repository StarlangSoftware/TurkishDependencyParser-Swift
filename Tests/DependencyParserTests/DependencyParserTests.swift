import XCTest
@testable import DependencyParser

final class DependencyParserTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DependencyParser().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
