//
//  GlobalFunc.swift
//  RpgSwift
//
//  Created by Edouard PLANTEVIN on 25/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation


// Stop if one team are dead
func keepOn() {
    if player1.teamMate.count == 0 {
        print("Bien joué \(player2.name) à gagner")
        exit(0)
    } else if player2.teamMate.count == 0 {
        print("Bien joué \(player1.name) à gagner")
        exit(0)
    }
}
