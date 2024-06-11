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
    
    /// Empty constructor for the UniversalDependencyTreeBankSentence. Initializes comments.
    public override init(){
        super.init()
    }
    
    /// Constructor for the UniversalDependencyTreeBankSentence.  Get a line as input and splits the line wrt tab
    /// character. The number of items should be 10. The items are id, surfaceForm, lemma, upos, xpos, feature list,
    /// head word index, dependency type, external dependencies and miscellaneous things for one word.
    /// - Parameter sentence: Sentence string to be processed.
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
    
    /// Adds a comment string to comments array list.
    /// - Parameter comment: Comment to be added.
    public func addComment(comment: String){
        comments.append(comment)
    }
    
    /// Overridden description method. Concatenates the strings of words to get the string of a sentence.
    /// - Returns: Concatenation of the strings of words.
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
    
    /// Compares the sentence with the given sentence and returns a parser evaluation score for this comparison. The result
    /// is calculated by summing up the parser evaluation scores of word by word dpendency relation comparisons.
    /// - Parameter sentence: Universal dependency sentence to be compared.
    /// - Returns: A parser evaluation score object.
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
