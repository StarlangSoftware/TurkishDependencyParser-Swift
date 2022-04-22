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

    public override init(sentence: String){
        super.init()
        let lines : [String] = sentence.split(whereSeparator: \.isNewline).map(String.init)
        for line in lines{
            if line.hasPrefix("#"){
                addComment(comment: line)
            } else {
                let items : [String] = line.split(separator: "\t").map(String.init)
                if items.count == 10{
                    if !items[0].contains("-"){
                        let id = items[0]
                        let surfaceForm = items[1]
                        let lemma = items[2]
                        let upos = UniversalDependencyRelation.getDependencyPosType(tag: items[3])
                        let xpos = items[4]
                        let features = UniversalDependencyTreeBankFeatures(features: items[5])
                        var relation : UniversalDependencyRelation? = nil
                        if items[6] != "_"{
                            let to = Int(items[6])!
                            let dependencyType : String = items[7].uppercased()
                            relation = UniversalDependencyRelation(toWord: to, dependencyType: dependencyType)
                        }
                        let deps = items[8]
                        let misc = items[9]
                        let word = UniversalDependencyTreeBankWord(id: Int(id)!, name: surfaceForm,
                                                                   lemma: lemma, upos: upos!, xpos: xpos, features: features, relation: relation, deps: deps, misc: misc)
                        addWord(word: word)
                    }
                }
            }
        }
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
