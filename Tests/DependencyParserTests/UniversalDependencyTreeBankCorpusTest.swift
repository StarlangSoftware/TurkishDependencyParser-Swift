import XCTest
import DataStructure
@testable import DependencyParser

final class UniversalDependencyTreeBankCorpusTest: XCTestCase {

    func wordCount(corpus: UniversalDependencyTreeBankCorpus) -> Int{
        var wordCount : Int = 0
        for i in 0..<corpus.sentenceCount() {
            wordCount += corpus.getSentence(index: i).wordCount()
        }
        return wordCount
    }

    func splitCount(corpus: UniversalDependencyTreeBankCorpus) -> Int{
        var splitCount : Int = 0
        for i in 0..<corpus.sentenceCount() {
            splitCount += (corpus.getSentence(index: i) as! UniversalDependencyTreeBankSentence).splitSize()
        }
        return splitCount
    }

    func testDependencyCorpus1() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "tr_gb-ud-test")
        XCTAssertEqual(2880, corpus.sentenceCount())
        XCTAssertEqual(17177, wordCount(corpus: corpus))
        XCTAssertEqual(371, splitCount(corpus: corpus))
    }

    func testDependencyCorpus2() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "tr_imst-ud-dev")
        XCTAssertEqual(1100, corpus.sentenceCount())
        XCTAssertEqual(10542, wordCount(corpus: corpus))
        XCTAssertEqual(279, splitCount(corpus: corpus))
    }

    func testDependencyCorpus3() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "tr_imst-ud-test")
        XCTAssertEqual(1100, corpus.sentenceCount())
        XCTAssertEqual(10032, wordCount(corpus: corpus))
        XCTAssertEqual(278, splitCount(corpus: corpus))
    }

    func testDependencyCorpus4() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "tr_imst-ud-train")
        XCTAssertEqual(3435, corpus.sentenceCount())
        XCTAssertEqual(37522, wordCount(corpus: corpus))
        XCTAssertEqual(1082, splitCount(corpus: corpus))
    }

    func testDependencyCorpus5() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "tr_pud-ud-test")
        XCTAssertEqual(1000, corpus.sentenceCount())
        XCTAssertEqual(16881, wordCount(corpus: corpus))
        XCTAssertEqual(346, splitCount(corpus: corpus))
    }

    static var allTests = [
        ("testExample1", testDependencyCorpus1),
        ("testExample2", testDependencyCorpus2),
        ("testExample3", testDependencyCorpus3),
        ("testExample4", testDependencyCorpus4),
        ("testExample5", testDependencyCorpus5),
    ]
}
