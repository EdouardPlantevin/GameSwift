//
//  Text.swift
//  GameSwfit
//
//  Created by Edouard PLANTEVIN on 28/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

// Only for mage suspense
class Suspense {
    
    // Use for make suspense
    static func suspense() {
        var i = 0
        while i != 2 {
            print(".")
            sleep(1)
            i += 1
        }
    }
    
    // Stop for 1s
    static func pause() {
        sleep(1)
    }
}
