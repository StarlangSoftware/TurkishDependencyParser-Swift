//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 29.03.2021.
//

import Foundation

public class TurkishDependencyRelation : DependencyRelation{
    
    private var _toIG: Int
    private var turkishDependencyType: TurkishDependencyType
    
    static var turkishDependencyTypes : [String] = ["VOCATIVE", "SUBJECT", "DATIVE.ADJUNCT", "OBJECT", "POSSESSOR",
    "MODIFIER", "S.MODIFIER", "ABLATIVE.ADJUNCT", "DETERMINER", "SENTENCE",
    "CLASSIFIER", "LOCATIVE.ADJUNCT", "COORDINATION", "QUESTION.PARTICLE", "INTENSIFIER",
    "INSTRUMENTAL.ADJUNCT", "RELATIVIZER", "NEGATIVE.PARTICLE", "ETOL", "COLLOCATION",
    "FOCUS.PARTICLE", "EQU.ADJUNCT", "APPOSITION"]
    
    static var turkishDependencyTags : [TurkishDependencyType] = [TurkishDependencyType.VOCATIVE, TurkishDependencyType.SUBJECT, TurkishDependencyType.DATIVE_ADJUNCT, TurkishDependencyType.OBJECT, TurkishDependencyType.POSSESSOR,
    TurkishDependencyType.MODIFIER, TurkishDependencyType.S_MODIFIER, TurkishDependencyType.ABLATIVE_ADJUNCT, TurkishDependencyType.DETERMINER, TurkishDependencyType.SENTENCE,
    TurkishDependencyType.CLASSIFIER, TurkishDependencyType.LOCATIVE_ADJUNCT, TurkishDependencyType.COORDINATION, TurkishDependencyType.QUESTION_PARTICLE, TurkishDependencyType.INTENSIFIER,
    TurkishDependencyType.INSTRUMENTAL_ADJUNCT, TurkishDependencyType.RELATIVIZER, TurkishDependencyType.NEGATIVE_PARTICLE, TurkishDependencyType.ETOL, TurkishDependencyType.COLLOCATION,
    TurkishDependencyType.FOCUS_PARTICLE, TurkishDependencyType.EQU_ADJUNCT, TurkishDependencyType.APPOSITION]
    
    /**
     * The getDependencyTag method takes an dependency tag as string and returns the {@link TurkishDependencyType}
     * form of it.
        - Parameters:
            - tag:  Type of the dependency tag in string form
        - Returns: Type of the dependency in {@link TurkishDependencyType} form
     */
    public static func getDependencyTag(tag: String) -> TurkishDependencyType?{
        for j in 0..<turkishDependencyTypes.count {
            if tag.lowercased() == turkishDependencyTypes[j].lowercased() {
                return turkishDependencyTags[j]
            }
        }
        return nil
    }
    
    /**
     * Another constructor for TurkishDependencyRelation. Gets input toWord, toIG, and dependencyType as arguments and
     * calls the super class's constructor and sets the IG and dependency type.
        - Parameters:
            - toWord: Index of the word in the sentence that dependency relation is related
            - toIG: Index of the inflectional group the dependency relation is related
            - dependencyType: Type of the dependency relation in string form
     */
    public init(toWord: Int, toIG: Int, dependencyType: String){
        self._toIG = toIG
        turkishDependencyType = TurkishDependencyRelation.getDependencyTag(tag: dependencyType)!;
        super.init(toWord: toWord);
    }

    /**
     * Accessor for the toIG attribute
        - Returns: toIG attribute
     */
    public func toIG() -> Int{
        return self._toIG
    }
    
    /**
     * Accessor for the turkishDependencyType attribute
        - Returns: turkishDependencyType attribute
     */
    public func getTurkishDependencyType() -> TurkishDependencyType{
        return turkishDependencyType
    }
    
    public func description() -> String{
        return turkishDependencyType.rawValue
    }

}
