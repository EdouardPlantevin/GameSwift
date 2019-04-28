//
//  Giant.swift
//  GameSwfit
//
//  Created by Edouard PLANTEVIN on 27/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class Giant : Hero {
    
    override init(name: String, player: Player) {
        super.init(name: name, player: player)
        super.life = 200
        super.maxLife = 200
        super.stuff = 5
        super.race = "Colosse"
        super.weapons = ["Ecu" : 5, "Gants" : 10, "Massue" : 15]
        super.activeWeapon = ["Ecu" : 5]
    }
    
}
