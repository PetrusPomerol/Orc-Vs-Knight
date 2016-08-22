//
//  Character.swift
//  Orc-vs-Solider
//
//  Created by Phu Nguyen on 8/16/16.
//  Copyright © 2016 Phu Nguyen. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int
    private var _attackPwr: Int
    
    var hp: Int{
    get {
    return _hp
    }
}
    
    var attackPwr: Int {
    get{
    return _attackPwr
    }
}
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            }
            else {
                return true
            }
        }
    }
    
        init(startingHp: Int, attackPwr: Int){
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        return true
    }
            }






