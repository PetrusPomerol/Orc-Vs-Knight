//
//  Player.swift
//  Orc-vs-Solider
//
//  Created by Phu Nguyen on 8/20/16.
//  Copyright © 2016 Phu Nguyen. All rights reserved.
//

import Foundation
class Player: Character {
    private var _name = "Player"
    var name: String {
        get{
            return _name
        }
    }
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, attackPwr: attackPwr)
        _name = name
    }
}