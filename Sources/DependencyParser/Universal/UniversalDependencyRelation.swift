//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 29.03.2021.
//

import Foundation

public class UniversalDependencyRelation : DependencyRelation, NSCopying{
    
    private var universalDependencyType: UniversalDependencyType = UniversalDependencyType.DEP
    
    static var universalDependencyTypes : [String] = ["ACL", "ADVCL", "ADVMOD", "AMOD", "APPOS", "AUX",
    "CASE", "CC", "CCOMP", "CLF", "COMPOUND", "CONJ", "COP", "CSUBJ", "DEP", "DET", "DISCOURSE", "DISLOCATED",
    "EXPL", "FIXED", "FLAT", "GOESWITH", "IOBJ", "LIST", "MARK", "NMOD", "NSUBJ", "NUMMOD", "OBJ", "OBL", "ORPHAN",
    "PARATAXIS", "PUNCT", "REPARANDUM", "ROOT", "VOCATIVE", "XCOMP", "ACL:RELCL", "AUX:PASS",
    "CC:PRECONJ", "COMPOUND:PRT", "DET:PREDET", "FLAT:FOREIGN",
    "NSUBJ:PASS", "CSUBJ:PASS", "NMOD:NPMOD", "NMOD:POSS",
    "NMOD:TMOD", "ADVMOD:EMPH", "AUX:Q", "COMPOUND:LVC",
    "COMPOUND:REDUP", "CSUBJ:COP", "NMOD:COMP", "NMOD:PART",
    "NSUBJ:COP", "OBL:AGENT", "OBL:TMOD", "OBL:NPMOD"]
    
    static var universalDependencyTags : [UniversalDependencyType] = [UniversalDependencyType.ACL, UniversalDependencyType.ADVCL,
    UniversalDependencyType.ADVMOD, UniversalDependencyType.AMOD, UniversalDependencyType.APPOS, UniversalDependencyType.AUX, UniversalDependencyType.CASE,
    UniversalDependencyType.CC, UniversalDependencyType.CCOMP, UniversalDependencyType.CLF, UniversalDependencyType.COMPOUND, UniversalDependencyType.CONJ,
    UniversalDependencyType.COP, UniversalDependencyType.CSUBJ, UniversalDependencyType.DEP, UniversalDependencyType.DET, UniversalDependencyType.DISCOURSE,
    UniversalDependencyType.DISLOCATED, UniversalDependencyType.EXPL, UniversalDependencyType.FIXED, UniversalDependencyType.FLAT,
    UniversalDependencyType.GOESWITH, UniversalDependencyType.IOBJ, UniversalDependencyType.LIST, UniversalDependencyType.MARK, UniversalDependencyType.NMOD,
    UniversalDependencyType.NSUBJ, UniversalDependencyType.NUMMOD, UniversalDependencyType.OBJ, UniversalDependencyType.OBL, UniversalDependencyType.ORPHAN,
    UniversalDependencyType.PARATAXIS, UniversalDependencyType.PUNCT, UniversalDependencyType.REPARANDUM, UniversalDependencyType.ROOT,
    UniversalDependencyType.VOCATIVE, UniversalDependencyType.XCOMP, UniversalDependencyType.ACL_RELCL, UniversalDependencyType.AUX_PASS,
    UniversalDependencyType.CC_PRECONJ, UniversalDependencyType.COMPOUND_PRT, UniversalDependencyType.DET_PREDET, UniversalDependencyType.FLAT_FOREIGN,
    UniversalDependencyType.NSUBJ_PASS, UniversalDependencyType.CSUBJ_PASS, UniversalDependencyType.NMOD_NPMOD, UniversalDependencyType.NMOD_POSS,
    UniversalDependencyType.NMOD_TMOD, UniversalDependencyType.ADVMOD_EMPH, UniversalDependencyType.AUX_Q, UniversalDependencyType.COMPOUND_LVC,
    UniversalDependencyType.COMPOUND_REDUP, UniversalDependencyType.CSUBJ_COP, UniversalDependencyType.NMOD_COMP, UniversalDependencyType.NMOD_PART,
    UniversalDependencyType.NSUBJ_COP, UniversalDependencyType.OBL_AGENT, UniversalDependencyType.OBL_TMOD, UniversalDependencyType.OBL_NPMOD]
    
    static var universalDependencyPosTypes : [String] = ["ADJ", "ADV", "INTJ", "NOUN", "PROPN", "VERB", "ADP", "AUX", "CCONJ",
    "DET", "NUM", "PART", "PRON", "SCONJ", "PUNCT", "SYM", "X"]
    
    static var universalDependencyPosTags : [UniversalDependencyPosType] = [UniversalDependencyPosType.ADJ, UniversalDependencyPosType.ADV, UniversalDependencyPosType.INTJ, UniversalDependencyPosType.NOUN, UniversalDependencyPosType.PROPN,
    UniversalDependencyPosType.VERB, UniversalDependencyPosType.ADP, UniversalDependencyPosType.AUX, UniversalDependencyPosType.CCONJ, UniversalDependencyPosType.DET, UniversalDependencyPosType.NUM, UniversalDependencyPosType.PART,
    UniversalDependencyPosType.PRON, UniversalDependencyPosType.SCONJ, UniversalDependencyPosType.PUNCT, UniversalDependencyPosType.SYM, UniversalDependencyPosType.X]
    
    
    /**
     * Overriden Universal Dependency Relation constructor. Gets toWord as input and calls it super class's constructor
        - Parameters:
            - toWord Index of the word in the sentence that dependency relation is related
     */
    public override init(toWord: Int){
        super.init(toWord: toWord)
    }
    
    /**
     * The getDependencyTag method takes an dependency tag as string and returns the {@link UniversalDependencyType}
     * form of it.
        - Parameters:
            - tag:  Type of the dependency tag in string form
        - Returns:
     *       Type of the dependency in {@link UniversalDependencyType} form
     */
    public static func getDependencyTag(tag: String) -> UniversalDependencyType?{
        for j in 0..<universalDependencyTags.count {
            if tag.lowercased() == universalDependencyTypes[j].lowercased() {
                return universalDependencyTags[j]
            }
        }
        return nil
    }
    
    /// The getDependencyPosType method takes a dependency pos type as string and returns the {@link UniversalDependencyPosType}
    /// form of it.
    /// - Parameter tag: Dependency pos type in string form
    /// - Returns: Dependency pos type for a given dependency pos string
    public static func getDependencyPosType(tag: String) -> UniversalDependencyPosType?{
        for j in 0..<universalDependencyPosTypes.count {
            if tag.lowercased() == universalDependencyPosTypes[j].lowercased() {
                return universalDependencyPosTags[j]
            }
        }
        return nil
    }
    
    /**
     * Another constructor for UniversalDependencyRelation. Gets input toWord and dependencyType as arguments and
     * calls the super class's constructor and sets the dependency type.
        - Parameters:
            - toWord: Index of the word in the sentence that dependency relation is related
            - dependencyType: Type of the dependency relation in string form
     */
    public init(toWord: Int, dependencyType: String){
        self.universalDependencyType = UniversalDependencyRelation.getDependencyTag(tag: dependencyType)!;
        super.init(toWord: toWord)
    }
    
    public func description() -> String{
        return universalDependencyType.rawValue
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        return UniversalDependencyRelation(toWord: toWord, dependencyType: description())
    }
    
    /// Compares the relation with the given universal dependency relation and returns a parser evaluation score for this
    /// comparison. If toWord fields are equal for both relation UAS is 1, otherwise it is 0. If both toWord and
    /// dependency types are the same, LAS is 1, otherwise it is 0. If only dependency types of both relations are
    /// the same, LS is 1, otherwise it is 0.
    /// - Parameter relation: Universal dependency relation to be compared.
    /// - Returns: A parser evaluation score object with (i) LAS = 1, if to and dependency types are same; LAS = 0,
    /// otherwise, (ii) UAS = 1, if to is the same; UAS = 0, otherwise, (iii) LS = 1, if dependency types are the same;
    /// LS = 0, otherwise.
    public func compareRelations(relation : UniversalDependencyRelation) -> ParserEvaluationScore{
        var LS : Double = 0.0
        var LAS : Double = 0.0
        var UAS : Double = 0.0
        if description() == relation.description(){
            LS = 1.0
            if toWord == relation.to(){
                LAS = 1.0
            }
        }
        if toWord == relation.to(){
            UAS = 1.0
        }
        return ParserEvaluationScore(LAS: LAS, UAS: UAS, LS: LS, wordCount:1)
    }


}
