import XCTest
@testable import DependencyParser

final class StanfordDependencyRelationTest: XCTestCase {

    func testDependencyType() {
        XCTAssertTrue(StanfordDependencyRelation.getDependencyTag(tag: "acomp") == StanfordDependencyType.ACOMP)
        XCTAssertTrue(StanfordDependencyRelation.getDependencyTag(tag: "discourse") == StanfordDependencyType.DISCOURSE)
        XCTAssertTrue(StanfordDependencyRelation.getDependencyTag(tag: "Iobj") == StanfordDependencyType.IOBJ)
        XCTAssertTrue(StanfordDependencyRelation.getDependencyTag(tag: "iobj") == StanfordDependencyType.IOBJ)
    }

    static var allTests = [
        ("testExample", testDependencyType),
    ]
}
