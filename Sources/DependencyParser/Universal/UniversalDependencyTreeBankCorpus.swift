//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation
import DataStructure
import Dictionary
import Corpus

public class UniversalDependencyTreeBankCorpus : Corpus{
    
    /// Constructs a universal dependency corpus from an input file. Reads the sentences one by one and constructs a
    /// universal dependency sentence from each line read.
    /// - Parameter fileName: Input file name.
    public override init(fileName: String){
        super.init()
        sentences = []
        wordList = CounterHashMap<Word>()
        let url = Bundle.module.url(forResource: fileName, withExtension: "conllu")
        do{
            let fileContent = try String(contentsOf: url!, encoding: .utf8)
            let lines : [String] = fileContent.split(omittingEmptySubsequences: false, whereSeparator: \.isNewline).map(String.init)
            var sentence : String = ""
            for line in lines{
                if line.isEmpty{
                    if !sentence.isEmpty{
                        addSentence(s: UniversalDependencyTreeBankSentence(sentence: sentence))
                    }
                    sentence = ""
                } else {
                    sentence = sentence + line + "\n"
                }
            }
        }catch{
        }
    }
    
    /// Compares the corpus with the given corpus and returns a parser evaluation score for this comparison. The result
    /// is calculated by summing up the parser evaluation scores of sentence by sentence comparisons.
    /// - Parameter corpus: Universal dependency corpus to be compared.
    /// - Returns: A parser evaluation score object.
    public func compareParses(corpus : UniversalDependencyTreeBankCorpus) -> ParserEvaluationScore{
        let score = ParserEvaluationScore()
        for i in 0..<sentences.count {
            let sentence1 = getSentence(index: i) as! UniversalDependencyTreeBankSentence
            let sentence2 = corpus.getSentence(index: i) as! UniversalDependencyTreeBankSentence
            score.add(parserEvaluationScore: sentence1.compareParses(sentence: sentence2))
        }
        return score
    }


}
