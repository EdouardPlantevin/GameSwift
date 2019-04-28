//
//  Dwarf.swift
//  GameSwfit
//
//  Created by Edouard PLANTEVIN on 27/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation


class Dwarf : Hero {
    
    override init(name: String, player: Player) {
        super.init(name: name, player: player)
        super.life = 60
        super.maxLife = 60
        super.race = "Nain"
        super.weapons = ["Tomawok" : 20, "Hachette" : 25, "Hache de guerre" : 30]
        super.activeWeapon = ["Tomawok" : 20]
    }
    
}
