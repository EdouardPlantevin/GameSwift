//
//  Fighter.swift
//  GameSwfit
//
//  Created by Edouard PLANTEVIN on 27/04/2019.
//  Copyright © 2019 Edouard PLANTEVIN. All rights reserved.
//

import Foundation

class Fighter : Hero {
    
    override init(name: String, player: Player) {
        super.init(name: name, player: player)
        super.life = 100
        super.stuff = 10
        super.race = "Combattant"
    }
    
}
