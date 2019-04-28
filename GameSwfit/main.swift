//
//  main.swift
//  RpgSwift
//
//  Created by Edouard PLANTEVIN on 24/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

// Array containt names players and heros to know if it's already used
var arrayNames = [String]()

// init text of the game
var suspense = Suspense()

// Create player
var player1 = Player()
var player2 = Player()

// Know names of the players
player1.getPlayerName()
player2.getPlayerName()

// Assign enemy
player1.enemyPlayer = player2
player2.enemyPlayer = player1


// Create Team
print("\n\(player1.name) c'est ton tour\n")
player1.createTeam(player: player1)
print("\n\(player2.name) c'est ton tour\n")
player2.createTeam(player: player2)


// Know how many turns in the game
var counter = 0

// Lunch game
while 1 == 1 {
    counter += 1
    player1.teamMate[0].choiceHero()
    player2.teamMate[0].choiceHero()
}








