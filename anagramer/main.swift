//
//  main.swift
//  anagramer
//
//  Created by Erik Little on 9/10/16.
//  Copyright © 2016 Erik Little. All rights reserved.
//

import Foundation

var anagrams = AnagramDictionary()

print(anagrams[of: "god", includeNonsense: false])
print(anagrams[of: "city", includeNonsense: false])
print(anagrams[of: "star", includeNonsense: false])

