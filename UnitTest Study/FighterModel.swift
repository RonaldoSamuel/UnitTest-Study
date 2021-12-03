//
//  Fighter.swift
//  UnitTest Study
//
//  Created by Ronaldo Filho on 03/12/21.
//

import Foundation

class FighterModel {
    var fighterType: FighterType
    var fighterStyle: PunchForce
    var health: Int = 100
    
    init(type: FighterType, combatStyle: PunchForce) {
        self.fighterType = type
        self.fighterStyle = combatStyle
    }
    
    func attack(enemy: FighterModel) {
        let damage = getDamagebase(fightStyle: fighterStyle)
        let resistence = refuseDamage(resistence: fighterType)
        
        if isOponentAlive(enemyHealth: enemy.health) {
            enemy.health -= getAttackresult(damage: damage, resistence: resistence)
        } else {
            print("you won the battle")
        }
        
    }
    
    func isOponentAlive(enemyHealth: Int) -> Bool {
        return enemyHealth > 0
    }
    
    func getDamagebase(fightStyle: PunchForce) -> Int {
        switch fightStyle {
        case .strong:
            return 50
        case .weak:
            return 30
        case .normal:
            return 40
        }
    }
    
    func refuseDamage(resistence: FighterType) -> Int {
        switch resistence {
        case .strong:
            return 15
        case .weak:
            return 5
        case .normal:
            return 10
        }
    }
    
    func getAttackresult(damage: Int, resistence: Int) -> Int {
        return damage - resistence
    }
        
}

enum FighterType {
    case strong, weak, normal
}

enum PunchForce {
    case strong, weak, normal
}
