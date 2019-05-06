//
//  Hero.swift
//  RpgSwift
//
//  Created by Edouard PLANTEVIN on 24/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class Hero {
    var name: String // Hero's name
    var player: Player // Hero's player
    var life: Int // Hero's life
    var maxLife: Int // healer can not heal more than maxLife
    var race: String // Mage, Giant, Fighter or Dwarf
    var weapons: [String:Int] // Dict contains all the weapons of a race
    var activeWeapon: [String:Int] // Dict contains only one weapon
    var isHealer: Bool // Know if hero make domage or heal || default false
    
    init(name: String, player: Player) {
        self.player = player
        self.name = name
        self.life = 0
        self.maxLife = 0
        self.race = ""
        self.weapons = [:]
        self.activeWeapon = [:]
        self.isHealer = false
    }
    
    
    
    /* ------- Choose which hero will fight/heal ------- */
    func choiceHero() {
        print("\n\(self.player.name) avec qui souhaite tu jouer ?\n")
        Suspense.pause() // Stop 1 sec
        // Show hero's team mate
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
    
    /* ----------- Choice a weapon ---------- */
    
    private func choiceWeapon() {
        
        // Random Int to know if a weapon chest appears
        let appears = Int.random(in: 1..<5)
        
        // If Ramdom == 1 Hero can choose an other weapon
        if appears == 1 {
            Suspense.suspense()
            print("\nUn coffre apparaît\n")
            // Info on active weapon
            print("\(self.name) est actuellement équipé de: \(self.activeWeapon.first!.key) qui " + (isHealer ? "rend" : "inflige" )  + " \(self.activeWeapon.first!.value) points de " + (isHealer ? "vie" : "degat") + "\n")
            print("Souhaite tu changer d'arme ?\n1: Oui\n2: Non\n")
            
            if let choice = readLine() {
                switch choice {
                case "1": // Change weapon
                    self.activeWeapon = [:]
                    print("\n\(self.name) ouvre un coffre\n")
                    let index = Int.random(in: 0 ..< 3)
                    let weaponName = Array(weapons)[index].key
                    let weaponStuff = Array(weapons)[index].value
                    // add actif weapon
                    self.activeWeapon[weaponName] = weaponStuff
                    Suspense.suspense()
                    // Info stuff
                    print("\(self.name) est actuellement équipé de: \(self.activeWeapon.first!.key) qui " + (isHealer ? "rend" : "inflige" )  + " \(self.activeWeapon.first!.value)\n")
                    attak()
                case "2": // Don't change weapon
                    print("\nBien à l'attaque alors\n")
                    attak()
                default:
                    print("\nje n'ai pas compris\n")
                    choiceWeapon()
                }
            }
        } else {
            // Info on active weapon
            print("\(self.name) est actuellement équipé de: \(self.activeWeapon.first!.key) qui " + (isHealer ? "rend" : "inflige" )  + " \(self.activeWeapon.first!.value) points de " + (isHealer ? "vie" : "degat") + "\n")
            attak()
        }
    }
    
    
    /* ------------- ATTAK ------------- */
    
    private func attak() {
        Suspense.suspense() // Stop 1 sec
        print((isHealer ? "Qui va tu soigné ?"  : "Qui va tu attaquer ?") + "\n")
        Suspense.pause() // Suspense.pauseStop 1 sec
            var i = 1
            // Show each team mate(heal) or each enemy team mate(attak)
            for hero in (isHealer ? self.player.teamMate : self.player.enemyPlayer!.teamMate) { // List hero's enemy
                print("\(i): \(hero.name) le \(hero.race) il possède \(hero.life) points de vie " + (isHealer ? "sur \(hero.life)" : ""))
                i += 1
            }
            print("\(i): Changer de personnage")
            if let choice = readLine() {
                if let index = Int(choice) {
                    if index <= (isHealer ? self.player.teamMate.count : self.player.enemyPlayer!.teamMate.count) && index != 0 {
                        Suspense.suspense()
                        if isHealer {
                            // var containt hero to heal
                            let heroSelect = self.player.teamMate[index - 1]
                            // condition to know if we sould heal him or if is already full life
                            if heroSelect.life + self.activeWeapon.first!.value <= heroSelect.maxLife {
                                heroSelect.life += self.activeWeapon.first!.value
                                self.player.allHeal += self.activeWeapon.first!.value // Stats for all heal in the game
                                print("\nVous avez soigner \(heroSelect.name)(\(heroSelect.life) points de vie)")
                            } else if heroSelect.life == heroSelect.maxLife {
                                print("\(heroSelect.name) est déjà full vie")
                                attak()
                            } else {
                                self.player.allHeal += heroSelect.maxLife - heroSelect.life // Stats for all heal in the game
                                self.player.allHeal += self.activeWeapon.first!.value
                                heroSelect.life = heroSelect.maxLife
                                print("\nVous avez soigner \(heroSelect.name)(\(heroSelect.life) points de vie, full life ;))")
                            }
                        } else {
                            // var containt hero to attak
                            let heroEnemySelect = self.player.enemyPlayer!.teamMate[index - 1]
                            heroEnemySelect.life -= self.activeWeapon.first!.value
                            self.player.allDamage += self.activeWeapon.first!.value // Stats for all damage in the game
                            print("\nVous avez enlever \(self.activeWeapon.first!.value) points de dégats à \(heroEnemySelect.name)")
                            // If hero enemy are dead he leave the game
                            if heroEnemySelect.life <= 0 {
                                print("\(heroEnemySelect.name) est mort")
                                // delete hero from the game
                                 self.player.enemyPlayer!.teamMate.remove(at: index - 1)
                            }
                        }
                    } // if player want to change Hero
                    else if index == (isHealer ? self.player.teamMate.count + 1 : self.player.enemyPlayer!.teamMate.count + 1) {
                        choiceHero()
                    } else {
                        print("Hum hum tu devais écrire un chiffre ex: 1\n")
                        attak()
                    }
                } else {
                    print("Hum hum tu devais écrire un chiffre ex: 1\n")
                    attak()
                }
            }
        // Should continue game ?
        Suspense.pause() // Stop 1 sec
        self.player.keepOn()
    }
}
