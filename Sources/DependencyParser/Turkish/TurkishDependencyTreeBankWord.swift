//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation
import MorphologicalAnalysis
import Dictionary

public class TurkishDependencyTreeBankWord : Word{
    
    private var parse: MorphologicalParse = MorphologicalParse()
    private var originalParses: [MorphologicalParse] = []
    private var relation : TurkishDependencyRelation? = nil
    
    /**
     * Accessor for the parse attribute
     - Returns: Parse attribute
     */
    public func getParse() -> MorphologicalParse{
        return parse
    }
    
    private func splitIntoInflectionalGroups(ig: String) -> [String]{
        var inflectionalGroups : [String] = []
        let igComponents = ig.components(separatedBy: CharacterSet(charactersIn: "[()]"))
        for igComponent in igComponents{
            if igComponent != ""{
                inflectionalGroups.append(igComponent)
            }
        }
        return inflectionalGroups
    }
    
    public init(attributeDict: [String : String]){
        super.init(name: "")
        let ig = attributeDict["IG"]
        self.parse = MorphologicalParse(inflectionalGroups: splitIntoInflectionalGroups(ig: ig!))
        let rel = attributeDict["REL"]
        if rel != "[,( )]"{
            let relComponents = rel!.components(separatedBy: CharacterSet(charactersIn: "[(,)]"))
            var index : Int = 0
            var toWord : Int = 0
            var toIG : Int = 0
            for relComponent in relComponents{
                if relComponent != ""{
                    index += 1
                    switch index {
                        case 1:
                            toWord = Int(relComponent)!
                        case 2:
                            toIG = Int(relComponent)!
                        case 3:
                            relation = TurkishDependencyRelation(toWord: toWord, toIG: toIG, dependencyType: relComponent)
                        default:
                            break
                    }
                }
            }
        }
        for i in 1...9{
            let parseString = attributeDict["ORG_IG" + String(i)]
            if parseString != nil{
                originalParses.append(MorphologicalParse(inflectionalGroups: splitIntoInflectionalGroups(ig: parseString!)))
            }
        }
    }
    
    /**
     * Accessor for a specific parse.
        - Parameters:
            - index: Index of the word.
        - Returns: Parse of the index'th word
     */
    public func getOriginalParse(index: Int) -> MorphologicalParse?{
        if index < originalParses.count{
            return originalParses[index]
        } else {
            return nil
        }
    }
    
    /**
     * Number of words in this item.
     - Returns: Number of words in this item.
     */
    public func size() -> Int{
        return originalParses.count
    }
    
    /**
     * Accessor for the relation attribute.
     - Returns: relation attribute.
     */
    public func getRelation() -> TurkishDependencyRelation?{
        return relation as TurkishDependencyRelation?
    }
    
}
