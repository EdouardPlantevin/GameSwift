//
//  Hero.swift
//  RpgSwift
//
//  Created by Edouard PLANTEVIN on 24/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class Hero {
    var name: String
    var player: Player // Witch Player create this hero
    var life: Int
    var stuff: Int
    var race: String
    var firstPlayer = true //know if actif player is player1 or player2
    
    init(name: String, player: Player) {
        self.player = player
        self.name = name
        self.life = 0
        self.stuff = 0
        self.race = ""
    }
    
    // return name's player
    func getPlayer() -> String {
        return self.player.name
    }
    
    // witch hero will attak
    func choiceHero() {
        // Change actif player
        if firstPlayer == true {
            firstPlayer = false
        } else if firstPlayer == false {
            firstPlayer = true
        }
        if firstPlayer == true {
            print("\n\(player1.name) avec qui souhaite tu jouer ?\n")
            var i = 1
            for hero in arrayTeamPlayer1 {
                print("\(i): \(hero.name) le \(hero.race)")
                i += 1
            }
            if let choice = readLine() {
                if let hero = Int(choice) {
                    if hero <= arrayTeamPlayer1.count || hero != 0 {
                        arrayTeamPlayer1[hero - 1].attak()
                    }
                } else {
                    print("Je n'ai pas compris\n")
                }
            }
        } else if firstPlayer == false {
            print("\n\(player2.name) avec qui souhaite tu jouer ?\n")
            var i = 1
            for hero in arrayTeamPlayer2 {
                print("\(i): \(hero.name) le \(hero.race)")
                i += 1
            }
            if let choice = readLine() {
                if let hero = Int(choice) {
                    if hero <= arrayTeamPlayer2.count || hero != 0 {
                        arrayTeamPlayer2[hero - 1].attak()
                    }
                } else {
                    print("Je n'ai pas compris\n")
                }
            }
        }
    }
    
    
    func attak() {
        if player.name == player1.name { // First player play
            if self.race != "Mage" { // Attak
                print("Qui va tu attaquer ?\n")
                var i = 1
                for hero in arrayTeamPlayer2 {
                    print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) points de vie")
                    i += 1
                }
                if let choice = readLine() {
                    if let hero = Int(choice) {
                        if hero <= arrayTeamPlayer2.count || hero != 0 {
                            arrayTeamPlayer2[hero - 1].life -= self.stuff
                            if arrayTeamPlayer2[hero - 1].life <= 0 {
                                print("\(arrayTeamPlayer2[hero - 1].name) est mort\n")
                                arrayTeamPlayer2.remove(at: hero - 1)
                            }
                        } else {
                            print("Hum hum tu devais écrire un chiffre ex: 1\n")
                            attak()
                        }
                    }
                }
            } else if self.race == "Mage" { // Heal
                print("Qui va tu soigner ?")
                var i = 1
                for hero in arrayTeamPlayer1 {
                    print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) point de vie")
                    i += 1
                }
                if let choice = readLine() {
                    if let hero = Int(choice) {
                        if hero <= arrayTeamPlayer1.count {
                            arrayTeamPlayer1[hero - 1].life += self.stuff
                        } else {
                            print("Hum hum tu devais écrire un chiffre ex: 1")
                            attak()
                        }
                    }
                }
            }
        } else if player.name == player2.name {
            if self.race != "Mage" { // Attak
                print("Qui va tu attaquer ?\n")
                var i = 1
                for hero in arrayTeamPlayer1 {
                    print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) points de vie")
                    i += 1
                }
                if let choice = readLine() {
                    if let hero = Int(choice) {
                        if hero <= arrayTeamPlayer1.count || hero != 0 {
                            arrayTeamPlayer1[hero - 1].life -= self.stuff
                            if arrayTeamPlayer1[hero - 1].life <= 0 {
                                print("\(arrayTeamPlayer1[hero - 1].name) est mort\n")
                                arrayTeamPlayer1.remove(at: hero - 1)
                            }
                        } else {
                            print("Hum hum tu devais écrire un chiffre ex: 1\n")
                            attak()
                        }
                    }
                }
            } else if self.race == "Mage" { // Heal
                print("Qui va tu soigner ?")
                var i = 1
                for hero in arrayTeamPlayer2 {
                    print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) points de vie")
                    i += 1
                }
                if let choice = readLine() {
                    if let hero = Int(choice) {
                        if hero <= arrayTeamPlayer2.count {
                            arrayTeamPlayer2[hero - 1].life += self.stuff
                        } else {
                            print("Hum hum tu devais écrire un chiffre ex: 1")
                            attak()
                        }
                    }
                }
            }
        }
    }
    
}
