//
//  Mage.swift
//  GameSwfit
//
//  Created by Edouard PLANTEVIN on 27/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class Mage : Hero {
    
    override init(name: String, player: Player) {
        super.init(name: name, player: player)
        super.life = 50
        super.maxLife = 50
        super.stuff = 10
        super.race = "Mage"
        super.weapons = ["Bâton" : 10, "Sceptre" : 15, "Grimoire" : 20]
        super.activeWeapon = ["Bâton" : 10]
        super.isHealer = true
    }
    
}
