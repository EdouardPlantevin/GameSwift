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
        super.stuff = 25
        super.race = "Nain"
    }
    
}
