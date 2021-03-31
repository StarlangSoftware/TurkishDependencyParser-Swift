//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation
import DataStructure
import Dictionary
import Corpus

public class UniversalDependencyTreeBankCorpus : Corpus{
    
    public override init(fileName: String){
        var sentence : UniversalDependencyTreeBankSentence? = nil
        super.init()
        sentences = []
        wordList = CounterHashMap<Word>()
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let url = thisDirectory.appendingPathComponent(fileName)
        do{
            let fileContent = try String(contentsOf: url, encoding: .utf8)
            let lines : [String] = fileContent.split(whereSeparator: \.isNewline).map(String.init)
            for line in lines{
                if line.hasPrefix("#"){
                    if sentence == nil{
                        sentence = UniversalDependencyTreeBankSentence()
                    }
                    if (sentence?.wordCount())! > 0{
                        addSentence(s: sentence!)
                        sentence = UniversalDependencyTreeBankSentence()
                    }
                    sentence?.addComment(comment: line)
                } else {
                    let items : [String] = line.split(separator: "\t").map(String.init)
                    if items.count == 10{
                        if !items[0].contains("-"){
                            let id = items[0]
                            let surfaceForm = items[1]
                            let lemma = items[2]
                            let upos = UniversalDependencyRelation.getDependencyPosType(tag: items[3])
                            let xpos = items[4]
                            let features = UniversalDependencyTreeBankFeatures(features: items[5])
                            var relation : UniversalDependencyRelation? = nil
                            if items[6] != "_"{
                                let to = Int(items[6])!
                                var dependencyType : String = items[7].uppercased()
                                if dependencyType.contains(":"){
                                    dependencyType = String(dependencyType[..<dependencyType.firstIndex(of: ":")!])
                                }
                                relation = UniversalDependencyRelation(toWord: to, dependencyType: dependencyType)
                            }
                            let deps = items[8]
                            let misc = items[9]
                            let word = UniversalDependencyTreeBankWord(id: Int(id)!, name: surfaceForm,
                                                                       lemma: lemma, upos: upos!, xpos: xpos, features: features, relation: relation, deps: deps, misc: misc)
                            sentence?.addWord(word: word)
                        }
                    }
                }
            }
        }catch{
        }
        if (sentence?.wordCount())! > 0{
            addSentence(s: sentence!)
        }
    }

}
