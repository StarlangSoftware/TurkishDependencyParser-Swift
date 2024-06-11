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
    
    /// Constructor of the universal dependency word. Sets the attributes.
    /// - Parameters:
    ///   - id: Id of the word
    ///   - name: Name of the word
    ///   - lemma: Lemma of the word
    ///   - upos: Universal part of speech tag.
    ///   - xpos: Extra part of speech tag
    ///   - features: Feature list of the word
    ///   - relation: Universal dependency relation of the word
    ///   - deps: External dependencies for the word
    ///   - misc: Miscellaneous information for the word.
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
    
    /// Accessor for the id attribute.
    /// - Returns: Id attribute
    public func getId() -> Int{
        return id;
    }
    
    /// Accessor for the lemma attribute
    /// - Returns: Lemma attribute
    public func getLemma() -> String{
        return lemma
    }
    
    /// Accessor for the upos attribute
    /// - Returns: Upos attribute
    public func getUpos() -> UniversalDependencyPosType{
        return upos
    }
    
    /// Accessor for the xpos attribute
    /// - Returns: Xpos attribute
    public func getXpos() -> String{
        return xpos
    }
    
    /// Accessor for the features attribute
    /// - Returns: Features attribute
    public func getFeatures() -> UniversalDependencyTreeBankFeatures{
        return features
    }
    
    /// Gets the value of a given feature.
    /// - Parameter featureName: Name of the feature
    /// - Returns: Value of the feature
    public func getFeatureValue(featureName: String) -> String{
        return features.getFeatureValue(feature: featureName)
    }
    
    /// Checks if the given feature exists.
    /// - Parameter featureName: Name of the feature
    /// - Returns: True if the given feature exists, false otherwise.
    public func featureExists(featureName: String) -> Bool{
        return features.featureExists(feature: featureName)
    }
    
    /// Accessor for the relation attribute.
    /// - Returns: Relation attribute
    public func getRelation()-> UniversalDependencyRelation?{
        return relation
    }
    
    /// Mutator for the relation attribute
    /// - Parameter relation: New relation attribute
    public func setRelation(relation: UniversalDependencyRelation){
        self.relation = relation
    }
    
    /// Accessor for the deps attribute
    /// - Returns: Xpos attribute
    public func getDeps() -> String{
        return deps
    }
    
    /// Accessor for the misc attribute
    /// - Returns: Misc attribute
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
