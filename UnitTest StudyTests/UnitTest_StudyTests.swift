//
//  UnitTest_StudyTests.swift
//  UnitTest StudyTests
//
//  Created by Ronaldo Filho on 03/12/21.
//

import XCTest
@testable import UnitTest_Study

class UnitTest_StudyTests: XCTestCase {
    var fighter1: FighterModel!
    var fighter2: FighterModel!
    
    override func setUp() {
        super.setUp()
        
        fighter1 = FighterModel(type: .strong, combatStyle: .normal)
        fighter2 = FighterModel(type: .normal, combatStyle: .strong)
    }
    
    func testIfStrongAtackDealsMoreDamageThenNormalAttack() {
        fighter1.attack(enemy: fighter2)
        fighter2.attack(enemy: fighter1)
        
        XCTAssertTrue(fighter1.health < fighter2.health)
    }
    
    func testIfStrongerFighterHasMoreReisistenceThanNormal() {
        XCTAssertTrue(fighter1.refuseDamage(resistence: fighter1.fighterType) > fighter2.refuseDamage(resistence: fighter2.fighterType))
    }
    
    func testCheckIfStrongAttackIsEqual50() {
        XCTAssertTrue(fighter2.getDamagebase(fightStyle: fighter2.fighterStyle) == 50)
    }
    
    override func tearDown() {
        super.tearDown()
        fighter1 = nil
        fighter2 = nil
    }

}
