//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation
import Corpus

public class TurkishDependencyTreeBankSentence : Sentence{
    
    /**
     * Calculates the maximum of all word to related word distances, where the distances are calculated in terms of index differences.
     - Returns: Maximum of all word to related word distances.
     */
    public func maxDependencyLength() -> Int{
        var max : Int = 0
        for i in 0..<words.count{
            let word = words[i] as! TurkishDependencyTreeBankWord
            if word.getRelation() != nil && word.getRelation()!.to() - i > max{
                max = word.getRelation()!.to() - i
            }
        }
        return max
    }
    
}
