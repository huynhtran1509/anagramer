//
//  Anagramer.swift
//  anagramer
//
//  Created by Erik Little on 9/10/16.
//  Copyright © 2016 Erik Little. All rights reserved.
//

import Foundation

enum AnagramError : Error {
    case tooManyCharacters
}

struct Anagramer {
    private static let anagrams = AnagramDictionary()
    
    let words: [String]
    
    init(words: String...) throws {
        guard words.joined().utf8.count > 30 else {
            throw AnagramError.tooManyCharacters
        }
        
        self.words = words
    }
    
    func constructAnagram() -> String {
        
        
        return "Nothing yet"
    }
}
