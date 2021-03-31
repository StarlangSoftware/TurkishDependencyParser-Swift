//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation
import Dictionary

class UniversalDependencyTreeBankWord : Word{
    
    private var id : Int
    private var lemma : String
    private var upos : UniversalDependencyPosType
    private var xpos : String
    private var features : UniversalDependencyTreeBankFeatures
    private var relation : UniversalDependencyRelation? = nil
    private var deps : String
    private var misc : String
    
    public init(id: Int, name: String, lemma: String, upos: UniversalDependencyPosType, xpos: String,
                features: UniversalDependencyTreeBankFeatures, relation: UniversalDependencyRelation?, deps: String, misc: String){
        self.id = id
        self.lemma = lemma
        self.upos = upos
        self.xpos = xpos
        self.deps = deps
        self.features = features
        self.relation = relation
        self.misc = misc
        super.init(name: name)
    }
    
    public func getId() -> Int{
        return id;
    }
    
    public func getLemma() -> String{
        return lemma
    }
    
    public func getUpos() -> UniversalDependencyPosType{
        return upos
    }
    
    public func getXpos() -> String{
        return xpos
    }
    
    public func getFeatures() -> UniversalDependencyTreeBankFeatures{
        return features
    }
    
    public func getFeatureValue(featureName: String) -> String{
        return features.getFeatureValue(feature: featureName)
    }
    
    public func getRelation()-> UniversalDependencyRelation?{
        return relation
    }
    
    public func setRelation(relation: UniversalDependencyRelation){
        self.relation = relation
    }
    
    public func getDeps() -> String{
        return deps
    }
    
    public func getMisc() -> String{
        return misc
    }
    
    public override func description() -> String {
        let part1 : String = String(id) + "\t" + getName() + "\t" + lemma + "\t" + upos.rawValue + "\t"
        let part2 : String = xpos + "\t" + features.description() + "\t" + String(relation!.to()) + "\t"
        let part3 : String = relation!.description().lowercased() + "\t" + deps + "\t" + misc
        return part1 + part2 + part3
    }
}
