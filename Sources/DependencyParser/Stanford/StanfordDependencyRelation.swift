//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 29.03.2021.
//

import Foundation

public class StanfordDependencyRelation : DependencyRelation{
    
    private var stanfordDependencyType : StanfordDependencyType
    
    static var stanfordDependencyTypes : [String] = ["acomp", "advcl", "advmod", "agent", "amod", "appos", "aux",
    "auxpass", "cc", "ccomp", "conj", "cop", "csubj", "csubjpass", "dep", "det", "discourse", "dobj", "expl", "goeswith",
    "iobj", "mark", "mwe", "neg", "nn", "npadvmod", "nsubj", "nsubjpass", "num", "number", "parataxis", "pcomp",
    "pobj", "poss", "possessive", "preconj", "predet", "prep", "prepc", "prt", "punct", "quantmod", "rcmod", "ref",
    "root", "tmod", "vmod", "xcomp", "xsubj"]
    
    static var stanfordDependencyTags : [StanfordDependencyType] = [StanfordDependencyType.ACOMP, StanfordDependencyType.ADVCL,
    StanfordDependencyType.ADVMOD, StanfordDependencyType.AGENT, StanfordDependencyType.AMOD, StanfordDependencyType.APPOS, StanfordDependencyType.AUX,
    StanfordDependencyType.AUXPASS, StanfordDependencyType.CC, StanfordDependencyType.CCOMP, StanfordDependencyType.CONJ, StanfordDependencyType.COP,
    StanfordDependencyType.CSUBJ, StanfordDependencyType.CSUBJPASS, StanfordDependencyType.DEP, StanfordDependencyType.DET, StanfordDependencyType.DISCOURSE,
    StanfordDependencyType.DOBJ, StanfordDependencyType.EXPL, StanfordDependencyType.GOESWITH, StanfordDependencyType.IOBJ, StanfordDependencyType.MARK,
    StanfordDependencyType.MWE, StanfordDependencyType.NEG, StanfordDependencyType.NN, StanfordDependencyType.NPADVMOD, StanfordDependencyType.NSUBJ,
    StanfordDependencyType.NSUBJPASS, StanfordDependencyType.NUM, StanfordDependencyType.NUMBER, StanfordDependencyType.PARATAXIS, StanfordDependencyType.PCOMP,
    StanfordDependencyType.POBJ, StanfordDependencyType.POSS, StanfordDependencyType.POSSESSIVE, StanfordDependencyType.PRECONJ, StanfordDependencyType.PREDET,
    StanfordDependencyType.PREP, StanfordDependencyType.PREPC, StanfordDependencyType.PRT, StanfordDependencyType.PUNCT, StanfordDependencyType.QUANTMOD,
    StanfordDependencyType.RCMOD, StanfordDependencyType.REF, StanfordDependencyType.ROOT, StanfordDependencyType.TMOD, StanfordDependencyType.VMOD,
    StanfordDependencyType.XCOMP, StanfordDependencyType.XSUBJ]
    
    /**
     * The getDependencyTag method takes an dependency tag as string and returns the {@link StanfordDependencyType}
     * form of it.
     - Parameters:
        -  tag:  Type of the dependency tag in string form
     - Returns: Type of the dependency in {@link StanfordDependencyType} form
     */
    public static func getDependencyTag(tag: String) -> StanfordDependencyType?{
        for j in 0..<stanfordDependencyTags.count {
            if tag.lowercased() == stanfordDependencyTypes[j].lowercased() {
                return stanfordDependencyTags[j]
            }
        }
        return nil
    }
    
    /**
     * Another constructor for StanfordDependencyRelation. Gets input toWord and dependencyType as arguments and
     * calls the super class's constructor and sets the dependency type.
     - Parameters:
        - toWord: Index of the word in the sentence that dependency relation is related
        - dependencyType: Type of the dependency relation in string form
     */
    public init(toWord: Int, dependencyType: String){
        stanfordDependencyType = StanfordDependencyRelation.getDependencyTag(tag: dependencyType)!;
        super.init(toWord: toWord);
    }
    
    public func description() -> String{
        return stanfordDependencyType.rawValue
    }
}
