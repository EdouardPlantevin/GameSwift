//
//  GlobalFunc.swift
//  GameSwfit
//
//  Created by Edouard PLANTEVIN on 27/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation


// Split arrayHeroPlayer to two array
func CreateArrayTeam() {
    var i = 0
    for hero in arrayHeroPlayer {
        if i < 3 {
            arrayTeamPlayer1.append(hero)
            i += 1
        } else {
            arrayTeamPlayer2.append(hero)
        }
    }
}

// Stop if one team are dead
func keepOn() {
    if arrayTeamPlayer1.count == 0 {
        print("Bien joué \(player2.name) à gagner")
        exit(0)
    } else if arrayTeamPlayer2.count == 0 {
        print("Bien joué \(player1.name) à gagner")
        exit(0)
    }
}
