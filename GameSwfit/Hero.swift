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
    var player: Player
    var life: Int
    var stuff: Int
    var race: String
    
    init(name: String, player: Player) {
        self.player = player
        self.name = name
        self.life = 0
        self.stuff = 0
        self.race = ""
    }
    
    func getPlayer() -> String {
        return self.player.name
    }
    
    // witch hero will attak
    func choiceHero() {
        print("\n\(self.player.name) avec qui souhaite tu jouer ?\n")
        var i = 1
        for hero in self.player.teamMate {
            print("\(i): \(hero.name) le \(hero.race)")
            i += 1
        }
        if let choice = readLine() {
            if let hero = Int(choice) {
                if hero <= self.player.teamMate.count || hero != 0 {
                    self.player.teamMate[hero - 1].attak()
                }
            } else {
                print("Je n'ai pas compris\n")
            }
        }
    }
    
    
    func attak() {
        if self.race != "Mage" { // Attak
            print("Qui va tu attaquer ?\n")
            var i = 1
            for hero in self.player.enemyPlayer!.teamMate { // List hero's enemy
                print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) points de vie")
                i += 1
            }
            if let choice = readLine() {
                if let hero = Int(choice) {
                    if hero <= self.player.enemyPlayer!.teamMate.count || hero != 0 {
                        self.player.enemyPlayer!.teamMate[hero - 1].life -= self.stuff
                        print("Vous avez enlever \(self.stuff) points de dégats à \(self.player.enemyPlayer!.teamMate[hero - 1].name)")
                        if self.player.enemyPlayer!.teamMate[hero - 1].life <= 0 {
                            print("\(self.player.enemyPlayer!.teamMate[hero - 1].name) est mort\n")
                            self.player.enemyPlayer!.teamMate.remove(at: hero - 1)
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
            for hero in self.player.teamMate {
                print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) point de vie")
                i += 1
            }
            if let choice = readLine() {
                if let hero = Int(choice) {
                    if hero <= self.player.teamMate.count {
                        self.player.teamMate[hero - 1].life += self.stuff
                    } else {
                        print("Hum hum tu devais écrire un chiffre ex: 1")
                        attak()
                    }
                }
            }
        }
    }
    
}
