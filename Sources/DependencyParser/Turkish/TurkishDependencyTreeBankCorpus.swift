//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 30.03.2021.
//

import Foundation
import Corpus
import DataStructure
import Dictionary
import MorphologicalAnalysis

public class TurkishDependencyTreeBankCorpus : NSObject, XMLParserDelegate{
    
    private var value: String = ""
    private var sentences: [Sentence] = []
    private var sentence: TurkishDependencyTreeBankSentence? = nil
    private var word: TurkishDependencyTreeBankWord? = nil

    /**
     * Empty constructor for {@link TurkishDependencyTreeBankCorpus}. Initializes the sentences and wordList attributes.
     */
    public override init(){
    }
    
    /// Another constructor for {@link TurkishDependencyTreeBankCorpus}. The method gets the corpus as a xml file, and
    /// reads sentences one by one. For each sentence, the function constructs a TurkishDependencyTreeBankSentence.
    /// - Parameter fileName: Input file name to read the TurkishDependencyTreeBankCorpus.
    public init(fileName: String){
        super.init()
        let url = Bundle.module.url(forResource: fileName, withExtension: "xml")
        let parser : XMLParser = XMLParser(contentsOf: url!)!
        parser.delegate = self
        parser.parse()
    }
    
    public func sentenceCount() -> Int{
        return sentences.count
    }
    
    public func getSentence(index: Int) -> Sentence{
        return sentences[index]
    }

    /**
     * Constructor to create an empty copy of this corpus.
     - Returns: An empty copy of this corpus.
     */
    public func emptyCopy() -> TurkishDependencyTreeBankCorpus{
        return TurkishDependencyTreeBankCorpus()
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        switch elementName {
            case "W":
                word = TurkishDependencyTreeBankWord(attributeDict: attributeDict)
            case "S":
                sentence = TurkishDependencyTreeBankSentence()
            default:
                break
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        switch elementName {
            case "W":
                word?.setName(name: value)
                sentence?.addWord(word: word!)
            case "S":
                sentences.append(sentence!)
            default:
                break
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String){
        if string != "\n"{
            value = value + string
        }
    }
}
