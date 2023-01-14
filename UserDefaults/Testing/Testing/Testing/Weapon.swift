//
//  Weapon.swift
//  Testing
//
//  Created by Gerardo Paxtian on 15/12/22.
//

import Foundation
struct Weapon {
    let damage: Int
    let type: WeaponType
    
    init (type: WeaponType) {
        self.damage = type.rawValue
        self.type = type
    }
    
    enum WeaponType: Int {
        case axe = 40
        case sword = 25
        case bomb = 60
    }
}
