//
//  Team.swift
//  RpgSwift
//
//  Created by Edouard PLANTEVIN on 24/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class Player {
    
    var name: String = ""
    var enemyPlayer: Player? // Optional, The first player can not have an enemy
    var teamMate: Array<Hero> = [] // Array containt 3 heros
    var allDamage: Int = 0
    var allHeal: Int = 0
    
    
    
    // Get name of the player
    func getPlayerName() {
        if arrayNames.count == 0 {
            print("Tu sera le premier joueur, quel est ton nom ?\n")
        } else {
            print("\nJoueur 2 approche et dis moi ton nom:\n")
        }
        if let playerName = readLine() {
            if playerName != "" && playerName.count < 30 {
                if arrayNames.contains(playerName) {
                    print("\nLe méchant joueur 1 à déjà pris vôtre nom !\n")
                    getPlayerName()
                } else {
                    name = playerName
                    arrayNames.append(playerName)
                }
            } else {
                print("\nTu dois écrire un nom valide, ex: Satan qui contient moins de 30 caractères")
                getPlayerName()
            }
        }
    }
    
    
    // The Player chooses which hero to play
    func createTeam(player: Player) {
        //Stop when we create 3 Heros
        var i = 0
        while i != 3 {
            print("Choisi un Hero")
            print("\n1: Combattant\n2: Mage\n3: Colosse\n4: Nain\n")
            if let answer = readLine() {
                switch answer {
                case "1":
                    print("\nQuel nom pour ton Combattant ?\n")
                    if let name = readLine() {
                        if name != "" && !arrayNames.contains(name) {
                            teamMate.append(Fighter(name: name, player: player))
                            arrayNames.append(name)
                            print("\n\(name) le Combattant à été créer\n")
                            i += 1
                        } else {
                            print("\nCe nom est déjà utiliser\n")
                        }
                    }
                    
                case "2":
                    print("\nQuel nom pour ton Mage ?\n")
                    if let name = readLine() {
                        if name != "" && !arrayNames.contains(name) {
                            teamMate.append(Mage(name: name, player: player))
                            arrayNames.append(name)
                            print("\n\(name) le Mage à été créer\n")
                            i += 1
                        } else {
                            print("\nCe nom est déjà utiliser\n")
                        }
                    }
                    
                case "3":
                    print("\nQuel nom pour ton Colosse ?\n")
                    if let name = readLine() {
                        if name != "" && !arrayNames.contains(name) {
                            teamMate.append(Giant(name: name, player: player))
                            arrayNames.append(name)
                            print("\n\(name) le Colosse à été créer\n")
                            i += 1
                        } else {
                            print("\nCe nom est déjà utiliser\n")
                        }
                    }
                case "4":
                    print("\nQuel nom pour ton Nain ?\n")
                    if let name = readLine() {
                        if name != "" && !arrayNames.contains(name) {
                            teamMate.append(Dwarf(name: name, player: player))
                            arrayNames.append(name)
                            print("\n\(name) le Nain à été créer\n")
                            i += 1
                        } else {
                            print("\nCe nom est déjà utiliser\n")
                        }
                    }
                default:
                    print("Tu dois choisir en écrivant 1, 2, 3 ou 4")
                }
            }
        }
    }
    
    
    // If a player no longer has a hero ... this is the end
    func keepOn() {
        if self.enemyPlayer!.teamMate.count == 0 {
            print("\nBien joué, \(self.name) à gagné\n")
            print("Voici les stats de la parie\n")
            // Stats winner Player
            print("> \(self.name) à enlever \(self.allDamage) points de vie")
            if self.allHeal > 0 {
                print("et soigné \(allHeal) points de vie")
            }
            
            // Stats loser Player
            print("\n> \(self.enemyPlayer!.name) à enlever \(self.enemyPlayer!.allDamage) points de vie")
            if self.enemyPlayer!.allHeal > 0 {
                print("et soigné \(self.enemyPlayer!.allHeal) points de vie")
            }
            
            // Counter
            print("\nLa partie c'est dérouler en \(counter) tours")
 
            restart.restartGame()
        }
    }
    
}
