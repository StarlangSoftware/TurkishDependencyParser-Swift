import XCTest
import DataStructure
@testable import DependencyParser

final class TurkishDependencyTreeBankCorpusTest: XCTestCase {

    func testDependencyCorpus() {
        let relationCounts : CounterHashMap<TurkishDependencyType> = CounterHashMap<TurkishDependencyType>()
        let corpus : TurkishDependencyTreeBankCorpus = TurkishDependencyTreeBankCorpus(fileName: "../metu-treebank.xml")
        XCTAssertEqual(5635, corpus.sentenceCount())
        var wordCount : Int = 0
        for i in 0..<corpus.sentenceCount(){
            let sentence : TurkishDependencyTreeBankSentence = corpus.getSentence(index: i) as! TurkishDependencyTreeBankSentence
            wordCount += sentence.wordCount()
            for j in 0..<sentence.wordCount(){
                let word : TurkishDependencyTreeBankWord = sentence.getWord(index: j) as! TurkishDependencyTreeBankWord
                if word.getRelation() != nil{
                    relationCounts.put(key: word.getRelation()!.getTurkishDependencyType())
                }
            }
        }
        XCTAssertEqual(11692, relationCounts.count(key: TurkishDependencyType.MODIFIER))
        XCTAssertEqual(903, relationCounts.count(key: TurkishDependencyType.INTENSIFIER))
        XCTAssertEqual(1142, relationCounts.count(key: TurkishDependencyType.LOCATIVE_ADJUNCT))
        XCTAssertEqual(240, relationCounts.count(key: TurkishDependencyType.VOCATIVE))
        XCTAssertEqual(7261, relationCounts.count(key: TurkishDependencyType.SENTENCE))
        XCTAssertEqual(16, relationCounts.count(key: TurkishDependencyType.EQU_ADJUNCT))
        XCTAssertEqual(159, relationCounts.count(key: TurkishDependencyType.NEGATIVE_PARTICLE))
        XCTAssertEqual(4481, relationCounts.count(key: TurkishDependencyType.SUBJECT))
        XCTAssertEqual(2476, relationCounts.count(key: TurkishDependencyType.COORDINATION))
        XCTAssertEqual(2050, relationCounts.count(key: TurkishDependencyType.CLASSIFIER))
        XCTAssertEqual(73, relationCounts.count(key: TurkishDependencyType.COLLOCATION))
        XCTAssertEqual(1516, relationCounts.count(key: TurkishDependencyType.POSSESSOR))
        XCTAssertEqual(523, relationCounts.count(key: TurkishDependencyType.ABLATIVE_ADJUNCT))
        XCTAssertEqual(23, relationCounts.count(key: TurkishDependencyType.FOCUS_PARTICLE))
        XCTAssertEqual(1952, relationCounts.count(key: TurkishDependencyType.DETERMINER))
        XCTAssertEqual(1361, relationCounts.count(key: TurkishDependencyType.DATIVE_ADJUNCT))
        XCTAssertEqual(202, relationCounts.count(key: TurkishDependencyType.APPOSITION))
        XCTAssertEqual(289, relationCounts.count(key: TurkishDependencyType.QUESTION_PARTICLE))
        XCTAssertEqual(597, relationCounts.count(key: TurkishDependencyType.S_MODIFIER))
        XCTAssertEqual(10, relationCounts.count(key: TurkishDependencyType.ETOL))
        XCTAssertEqual(8338, relationCounts.count(key: TurkishDependencyType.OBJECT))
        XCTAssertEqual(271, relationCounts.count(key: TurkishDependencyType.INSTRUMENTAL_ADJUNCT))
        XCTAssertEqual(85, relationCounts.count(key: TurkishDependencyType.RELATIVIZER))
        XCTAssertEqual(53993, wordCount)
    }

    static var allTests = [
        ("testExample", testDependencyCorpus),
    ]
}
