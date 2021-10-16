//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation
import Corpus

public class UniversalDependencyTreeBankSentence : Sentence{
    
    private var comments : [String] = []
    
    public override init(){
        super.init()
    }
    
    public func addComment(comment: String){
        comments.append(comment)
    }
    
    public override func description() -> String {
        var result : String = ""
        for comment in comments{
            result += comment + "\n"
        }
        for w in words{
            let word = w as! UniversalDependencyTreeBankWord
            result += word.description() + "\n"
        }
        return result
    }
    
    public func compareParses(sentence : UniversalDependencyTreeBankSentence) -> ParserEvaluationScore{
        let score = ParserEvaluationScore()
        for i in 0..<words.count {
            let relation1 = (getWord(index: i) as! UniversalDependencyTreeBankWord).getRelation()
            let relation2 = (sentence.getWord(index: i) as! UniversalDependencyTreeBankWord).getRelation()
            if relation1 != nil && relation2 != nil {
                score.add(parserEvaluationScore: relation1!.compareRelations(relation: relation2!))
            }
        }
        return score
    }
}
