//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 29.03.2021.
//

import Foundation

public class DependencyRelation {
    
    var toWord: Int
    
    /**
     * Constructor for a {@link DependencyRelation}. Takes toWord as a parameter and sets the corresponding attribute.
        - Parameters:
            - toWord:  Index of the word in the sentence that dependency relation is related
     */
    public init(toWord: Int){
        self.toWord = toWord
    }
    
    /**
     * Accessor for toWord attribute
        - Returns: toWord attribute value
     */
    public func to() -> Int{
        return toWord
    }
    
}
