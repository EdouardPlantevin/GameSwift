//
//  LunchGame.swift
//  GameSwift
//
//  Created by Edouard PLANTEVIN on 11/05/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class LunchGame {
    
    func welcome() {
        print("**************************************************************************")
        print("****************************** Bienvenue *********************************")
        print("**************** Je suis Edouard et je serai vôtre guide  ****************")
        print("******************* Les règles du jeu son très simple ********************")
        print("************* Vous êtes deux joueurs qui vont s'affronter  ***************")
        print("*********** Vous aurez chacun trois hero pour vous défendre **************")
        print("**************************************************************************")
        menu()
    }
    
    private func menu() {
        print("\nEtes-vous prêt ?\n1: Commencer la partie.\n2: Voir les stats des différents heros.\n3: Règles du jeu.\n4: Quitter\n")
        if let choice = readLine() {
            switch choice {
            case "1":
                print("\n")
                lunchGame()
            case "2":
                print("\n1: Le combattant possède 100 points de vie est commence la partie avec une arme qui inflige 15 de dégats\n2: Le mage est un soigneur qui possède 70 points de vie et soigne 10 points de dégats avec son arme de base\n3: Le colosse est un mastodonte qui possède 130 points de vie et inflige 5 points de dégats\n4: Le nain est un redoutable guerrier qui possède 60 points de vie et inflige 20 points de dégats avec son arme de base")
                menu()
            case "3":
                print("Vous allez créer chacun trois heros pour combattre à vos côté, le but du jeu est de tuer tous les heros adverses, une fois cette objectif atteint la partie se termine")
                menu()
            case "4":
                exit(0)
            default:
                print("Je n'ai pas compris")
                menu()
            }
        }
    }
    
    func lunchGame() {
        
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
        while 1 == 1 {
            // counter for stat
            counter += 1
            player1.teamMate[0].choiceHero()
            player2.teamMate[0].choiceHero()
        }
    }
    
    
}
