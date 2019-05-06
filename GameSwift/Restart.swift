//
//  Restart.swift
//  GameSwift
//
//  Created by Edouard PLANTEVIN on 06/05/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class Restart {
    
    func restartGame() {
        print("\nRelancer une nouvelle partie ?\n1: Oui\n2: Non")
        
        if let choice = readLine() {
            if choice == "1" {
                
                // we initialize everything
                player1.teamMate = []
                player1.allHeal = 0
                player1.allDamage = 0
                
                player2.teamMate = []
                player2.allHeal = 0
                player2.allDamage = 0
                
                arrayNames = []
                counter = 0
                arrayNames.append(player1.name)
                arrayNames.append(player2.name)
                
                // create new heros
                print("\(player1.name) c'est ton tour")
                player1.createTeam(player: player1)
                print("\(player2.name) c'est ton tour")
                player2.createTeam(player: player2)
            } else if choice == "2" {
                exit(0)
            } else {
                print("Je n'ai pas compris")
                restartGame()
            }
        }
    }
}
