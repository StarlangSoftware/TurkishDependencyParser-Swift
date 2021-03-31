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

    func testDependencyCorpus1() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "../tr_gb-ud-test.conllu")
        XCTAssertEqual(2802, corpus.sentenceCount())
        XCTAssertEqual(16881, wordCount(corpus: corpus))
    }

    func testDependencyCorpus2() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "../tr_imst-ud-dev.conllu")
        XCTAssertEqual(988, corpus.sentenceCount())
        XCTAssertEqual(10046, wordCount(corpus: corpus))
    }

    func testDependencyCorpus3() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "../tr_imst-ud-test.conllu")
        XCTAssertEqual(983, corpus.sentenceCount())
        XCTAssertEqual(10029, wordCount(corpus: corpus))
    }

    func testDependencyCorpus4() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "../tr_imst-ud-train.conllu")
        XCTAssertEqual(3664, corpus.sentenceCount())
        XCTAssertEqual(37784, wordCount(corpus: corpus))
    }

    func testDependencyCorpus5() {
        let corpus : UniversalDependencyTreeBankCorpus = UniversalDependencyTreeBankCorpus(fileName: "../tr_pud-ud-test.conllu")
        XCTAssertEqual(1000, corpus.sentenceCount())
        XCTAssertEqual(16882, wordCount(corpus: corpus))
    }

    static var allTests = [
        ("testExample1", testDependencyCorpus1),
        ("testExample2", testDependencyCorpus2),
        ("testExample3", testDependencyCorpus3),
        ("testExample4", testDependencyCorpus4),
        ("testExample5", testDependencyCorpus5),
    ]
}
