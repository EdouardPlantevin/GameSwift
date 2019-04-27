//
//  main.swift
//  GameSwfit
//
//  Created by Edouard PLANTEVIN on 27/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

// Array containt names players to know if it's already used
var arrayNames = [String]()

// Array containt all Hero
var arrayHeroPlayer = [Hero]()

// two array for each team
var arrayTeamPlayer1 = [Hero]()
var arrayTeamPlayer2 = [Hero]()

// Create player
var player1 = Player()
var player2 = Player()


// Know names of players
player1.getPlayerName()
player2.getPlayerName()


// Create Team
print("\n\(player1.name) c'est ton tour\n")
player1.createTeam(player: player1)
print("\n\(player2.name) c'est ton tour\n")
player2.createTeam(player: player2)


// Fill in the arrays arrayTeamPlayer
CreateArrayTeam()


// Lunch game
while 1 == 1 {
    arrayTeamPlayer1[0].choiceHero()
    keepOn()
    for hero in arrayTeamPlayer2 {
        print("\(hero.name), à \(hero.life) points de vie")
    }
}


