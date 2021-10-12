//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation

public class UniversalDependencyTreeBankFeatures{
    
    private var featureList : Dictionary<String, String>
    
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
    
    public func getFeatureValue(feature: String) -> String{
        return featureList[feature]!
    }

    public func featureExists(feature: String) -> Bool{
        return featureList[feature] != nil
    }

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
