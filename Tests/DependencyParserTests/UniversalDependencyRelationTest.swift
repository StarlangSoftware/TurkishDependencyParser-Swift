import XCTest
@testable import DependencyParser

final class UniversalDependencyRelationTest: XCTestCase {

    func testDependencyType() {
        XCTAssertTrue(UniversalDependencyRelation.getDependencyTag(tag: "acl") == UniversalDependencyType.ACL)
        XCTAssertTrue(UniversalDependencyRelation.getDependencyTag(tag: "iobj") == UniversalDependencyType.IOBJ)
        XCTAssertTrue(UniversalDependencyRelation.getDependencyTag(tag: "Iobj") == UniversalDependencyType.IOBJ)
        XCTAssertTrue(UniversalDependencyRelation.getDependencyTag(tag: "fixed") == UniversalDependencyType.FIXED)
    }

    func testDependencyPosType() {
        XCTAssertTrue(UniversalDependencyRelation.getDependencyPosType(tag: "adj") == UniversalDependencyPosType.ADJ)
        XCTAssertTrue(UniversalDependencyRelation.getDependencyPosType(tag: "intj") == UniversalDependencyPosType.INTJ)
        XCTAssertTrue(UniversalDependencyRelation.getDependencyPosType(tag: "Det") == UniversalDependencyPosType.DET)
    }

    static var allTests = [
        ("testExample1", testDependencyType),
        ("testExample2", testDependencyPosType),
    ]
}
