//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 16.10.2021.
//

import Foundation

public class ParserEvaluationScore{
    
    private var LAS : Double = 0.0
    private var UAS : Double = 0.0
    private var LS : Double = 0.0
    private var wordCount : Int = 0
    
    public init(){
        
    }
    
    public init(LAS : Double, UAS : Double, LS : Double, wordCount : Int){
        self.LAS = LAS
        self.UAS = UAS
        self.LS = LS
        self.wordCount = wordCount
    }

    public func getLS() -> Double {
        return LS
    }

    public func getLAS() -> Double {
        return LAS
    }

    public func getUAS() -> Double {
        return UAS
    }

    public func getWordCount() -> Int {
        return wordCount
    }

    public func add(parserEvaluationScore : ParserEvaluationScore){
        LAS = (LAS * Double(wordCount) + parserEvaluationScore.LAS * Double(parserEvaluationScore.wordCount)) / (Double(wordCount) + Double(parserEvaluationScore.wordCount))
        UAS = (UAS * Double(wordCount) + parserEvaluationScore.UAS * Double(parserEvaluationScore.wordCount)) / (Double(wordCount) + Double(parserEvaluationScore.wordCount))
        LS = (LS * Double(wordCount) + parserEvaluationScore.LS * Double(parserEvaluationScore.wordCount)) / (Double(wordCount) + Double(parserEvaluationScore.wordCount))
        wordCount += parserEvaluationScore.wordCount
    }

}
