import XCTest
@testable import DependencyParser

final class TurkishDependencyRelationTest: XCTestCase {

    func testDependencyType() {
        XCTAssertTrue(TurkishDependencyRelation.getDependencyTag(tag: "subject") == TurkishDependencyType.SUBJECT)
        XCTAssertTrue(TurkishDependencyRelation.getDependencyTag(tag: "vocative") == TurkishDependencyType.VOCATIVE)
        XCTAssertTrue(TurkishDependencyRelation.getDependencyTag(tag: "Relativizer") == TurkishDependencyType.RELATIVIZER)
    }

    static var allTests = [
        ("testExample", testDependencyType),
    ]
}
