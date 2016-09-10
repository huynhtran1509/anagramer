//
//  AnagramDictionary.swift
//  anagramer
//
//  Created by Erik Little on 9/10/16.
//  Copyright © 2016 Erik Little. All rights reserved.
//

import Foundation

struct AnagramDictionary {
    private lazy var anagrams = AnagramDictionary.createAnagramDictionary()
    
    subscript(of word: String) -> [String]? {
        mutating get {
            return anagrams[String(word.characters.sorted())]?.filter({$0 != word})
        }
    }
    
    private static func createAnagramDictionary() -> [String: [String]] {
        let words: [String]
        var anagrams = [String: [String]]()
        
        do {
            words = try String(contentsOfFile: "/usr/share/dict/words").components(separatedBy: "\n")
        } catch {
            words = []
        }
        
        for word in words {
            let key = String(word.characters.sorted())
            let anagramsForWord = anagrams[key] ?? []
            
            anagrams[key] = anagramsForWord + [word]
        }
                
        return anagrams
    }
}

