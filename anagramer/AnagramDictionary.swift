//
//  AnagramDictionary.swift
//  anagramer
//
//  Created by Erik Little on 9/10/16.
//  Copyright © 2016 Erik Little. All rights reserved.
//

import Foundation

struct AnagramDictionary {
    private static var words = AnagramDictionary.getWords()

    private lazy var anagrams = AnagramDictionary.createAnagramDictionary()
    private lazy var completeAnagrams = AnagramDictionary.createAnagramsStupidly()
    
    subscript(of word: String, includeNonsense nonsense: Bool) -> [String]? {
        mutating get {
            if nonsense {
                return completeAnagrams[word]?.filter({$0 != word})
            } else {
                return anagrams[String(word.characters.sorted())]?.filter({$0 != word})
            }
        }
    }
    
    private static func createAnagramDictionary() -> [String: [String]] {
        var anagrams = [String: [String]]()
        
        for word in words {
            let key = String(word.characters.sorted())
            let anagramsForWord = anagrams[key] ?? []
            
            anagrams[key] = anagramsForWord + [word]
        }
                
        return anagrams
    }
    
    private static func createAnagramsStupidly() -> [String: [String]] {
        var anagrams = [String: [String]]()
        
        func createAnagramsForWord(_ word: String) -> [String] {
            var anagramsForWord = [String]()
            
            // Heap's Algorithm
            func creator(_ characters: inout [String], _ n: Int) {
                guard n != 1 else {
                    anagramsForWord.append(characters.joined())
                    
                    return
                }
                
                for i in 0..<n-1 {
                    creator(&characters, n - 1)
                    
                    if n % 2 == 0 {
                        (characters[i], characters[n - 1]) = (characters[n - 1], characters[i])
                    } else {
                        (characters[0], characters[n - 1]) = (characters[n - 1], characters[0])
                    }
                }
                
                creator(&characters, n - 1)
            }
            
            var characters = word.characters.map({String($0)})
            
            creator(&characters, characters.count)
            
            return anagramsForWord
        }
        
        for word in words {
            anagrams[word] = createAnagramsForWord(word)
        }
        
        return anagrams
    }
    
    private static func getWords() -> [String] {
        let words: [String]
        
        do {
            words = try String(contentsOfFile: "/usr/share/dict/words").components(separatedBy: "\n")
        } catch {
            words = []
        }
        
        return words
    }
}
