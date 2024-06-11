//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation

public class UniversalDependencyTreeBankFeatures{
    
    private var featureList : Dictionary<String, String>
    
    /// Constructor of a UniversalDependencyTreeBankFeatures object. Given the language of the word and features of the
    /// word as a string, the method splits the features with respect to pipe character. Then for each feature type and
    /// value pair, their values and types are inserted into the featureList hash map. The method also check for validity
    /// of the feature values for that feature type.
    /// - Parameter features: Feature string.
    public init(features: String){
        featureList = Dictionary()
        if features != "_"{
            let list = features.split(separator: "|")
            for feature in list{
                if feature.contains("="){
                    let featureName = String(feature[..<feature.firstIndex(of: "=")!])
                    let featureValue =  String(feature[feature.index(after: feature.firstIndex(of: "=")!)...])
                    featureList[featureName] = featureValue
                }
            }
        }
    }
    
    /// Gets the value of a given feature.
    /// - Parameter feature: Name of the feature
    /// - Returns: Value of the feature
    public func getFeatureValue(feature: String) -> String{
        return featureList[feature]!
    }
    
    /// Checks if the given feature exists in the feature list.
    /// - Parameter feature: Name of the feature
    /// - Returns: True, if the feature list contains the feature, false otherwise.
    public func featureExists(feature: String) -> Bool{
        return featureList[feature] != nil
    }
    
    /// Overridden description method. Returns feature with their values separated with pipe characters.
    /// - Returns: A string of feature values and their names separated with pipe character.
    public func description() -> String{
        if featureList.isEmpty{
            return "_"
        }
        var result : String = ""
        for feature in featureList.keys{
            if result == ""{
                result = feature + "=" + getFeatureValue(feature: feature)
            } else {
                result += "|" + feature + "=" + getFeatureValue(feature: feature)
            }
        }
        return result;
    }
}
