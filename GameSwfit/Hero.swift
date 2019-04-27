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
    var maxLife: Int
    var stuff: Int
    var race: String
    var weapons: [String:Int]
    var activeWeapon: [String:Int]
    
    init(name: String, player: Player) {
        self.player = player
        self.name = name
        self.life = 0
        self.maxLife = 0
        self.stuff = 0
        self.race = ""
        self.weapons = [:]
        self.activeWeapon = [:]
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
                if hero <= self.player.teamMate.count && hero != 0 {
                    self.player.teamMate[hero - 1].choiceWeapon()
                } else {
                    print("Je n'ai pas compris")
                    choiceHero()
                }
            } else {
                print("Je n'ai pas compris\n")
                choiceHero()
            }
        }
    }
    
    func choiceWeapon() {
        if self.activeWeapon == [:] { // If hero doesn't have any weapon
            print("\n\(self.name) ouvre un coffre\n")
            let index = Int.random(in: 0 ..< 3)
            let weaponName = Array(weapons)[index].key
            let weaponStuff = Array(weapons)[index].value
            // add actif weapon
            self.activeWeapon[weaponName] = weaponStuff
            print("\(self.name) est actuellement équipe de: \(self.activeWeapon.first!.key) qui inflige \(self.activeWeapon.first!.value)\n")
            attak()
        } else {
            print("\(self.name) est actuellement équipe de: \(self.activeWeapon.first!.key) qui inflige \(self.activeWeapon.first!.value)\n")
            print("Souhaite tu changer d'arme ?\n1: Oui\n2: Non")
            
            if let choice = readLine() {
                switch choice {
                case "1":
                    self.activeWeapon = [:]
                    print("\n\(self.name) ouvre un coffre\n")
                    let index = Int.random(in: 0 ..< 3)
                    let weaponName = Array(weapons)[index].key
                    let weaponStuff = Array(weapons)[index].value
                    // add actif weapon
                    self.activeWeapon[weaponName] = weaponStuff
                    
                    // If != mage make domag if == mage heal
                    if self.name != "Mage" {
                        print("\(self.name) est actuellement équipe de:  \(self.activeWeapon.first!.key) qui inflige \(self.activeWeapon.first!.value)\n")
                    } else {
                        print("\(self.name) est actuellement équipe de:  \(self.activeWeapon.first!.key) qui rend \(self.activeWeapon.first!.value) points de vie\n")
                    }

                    attak()
                case "2":
                    print("\nBien à l'attaque alors\n")
                    attak()
                default:
                    print("\nje n'ai pas compris\n")
                    choiceWeapon()
                }
            }
        }
        
        
    }
    
    
    
    func attak() {
        if self.race != "Mage" { // ------- ATTAK -------
            print("Qui va tu attaquer ?\n")
            var i = 1
            for hero in self.player.enemyPlayer!.teamMate { // List hero's enemy
                print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) points de vie")
                i += 1
            }
            if let choice = readLine() {
                if let hero = Int(choice) {
                    if hero <= self.player.enemyPlayer!.teamMate.count && hero != 0 {
                        self.player.enemyPlayer!.teamMate[hero - 1].life -= self.stuff + self.activeWeapon.first!.value
                        print("Vous avez enlever \(self.stuff + self.activeWeapon.first!.value) points de dégats à \(self.player.enemyPlayer!.teamMate[hero - 1].name)")
                        if self.player.enemyPlayer!.teamMate[hero - 1].life <= 0 {
                            print("\(self.player.enemyPlayer!.teamMate[hero - 1].name) est mort\n")
                            self.player.enemyPlayer!.teamMate.remove(at: hero - 1)
                        }
                    } else {
                        print("Hum hum tu devais écrire un chiffre valide ex: 1)\n")
                        attak()
                    }
                } else {
                    print("Hum hum tu devais écrire un chiffre ex: 1\n")
                    attak()
                }
            }
        }  else if self.race == "Mage" { // ------ HEAL ------
            print("Qui va tu soigner ?")
            var i = 1
            for hero in self.player.teamMate {
                print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) point de vie sur \(hero.maxLife)")
                i += 1
            }
            if let choice = readLine() {
                if let hero = Int(choice) {
                    if hero <= self.player.teamMate.count {
                        // condition to know if we sould heal him, but his life at maxLife or if is already full life
                        if self.player.teamMate[hero - 1].life + self.stuff + self.activeWeapon.first!.value <= self.player.teamMate[hero - 1].maxLife {
                            self.player.teamMate[hero - 1].life += self.stuff + self.activeWeapon.first!.value
                            print("\nVous avez soignée \(player.teamMate[hero - 1].name)(\(player.teamMate[hero - 1].life) points de vie)")
                        } else if self.player.teamMate[hero - 1].life == self.player.teamMate[hero - 1].maxLife {
                            print("\(self.player.teamMate[hero - 1].name) est déjà full vie")
                            attak()
                        } else {
                            self.player.teamMate[hero - 1].life = self.player.teamMate[hero - 1].maxLife
                            print("\nVous avez soignée \(player.teamMate[hero - 1].name)(\(player.teamMate[hero - 1].life) points de vie, full life ;))")
                        }
                    } else {
                        print("Hum hum tu devais écrire un chiffre valide ex: 1")
                        attak()
                    }
                } else {
                    print("Hum hum tu devais écrire un chiffre ex: 1")
                    attak()
                }
            }
        }
        self.player.keepOn()
    }
    
}
