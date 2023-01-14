//
//  Locations.swift
//  Proyecto MVC
//
//  Created by Gerardo Paxtian on 09/01/23.
//

import Foundation

struct Hero: Codable {
    let id: String
}

struct Locations: Codable {
    let dateShow: String
    let latitud: String
    let longitud: String
    let id: String
    let hero: Hero
}
