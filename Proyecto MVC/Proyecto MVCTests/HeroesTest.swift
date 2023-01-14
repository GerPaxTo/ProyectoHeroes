//
//  HeroesTest.swift
//  Proyecto MVCUITests
//
//  Created by Gerardo Paxtian on 21/12/22.
//

import XCTest
@testable import Proyecto_MVC

final class HeroesTest: XCTestCase {
    
    var heroe: Heroe!

    override func setUp() {
        super.setUp()
        
        heroe = Heroe(id: "4",
                     name: "Goku",
                     photo: "https://www.keepcodig.io",
                     description: "Goku always win!!!",
                     favorite: false)
    }

    override func tearDown() {
        heroe = nil
        super.tearDown()
    }

    func testHeroeId() {
        XCTAssertNotNil(heroe.id)
        XCTAssertEqual(heroe.id, "4")
        XCTAssertNotEqual(heroe.id, "7")
    }
    
    func testHeroeName() {
        XCTAssertNotNil(heroe.name)
        XCTAssertEqual(heroe.name, "Goku")
        XCTAssertNotEqual(heroe.id, "Vegeta")
    }
    
    func testHeroePhoto() {
        let url = URL(string:  heroe.photo)
        XCTAssertNotNil(heroe.photo)
        XCTAssertEqual(heroe.photo, "https://www.keepcodig.io")
        XCTAssertNotEqual(heroe.photo, "https://www.keepcodig.com")
        
        XCTAssertNotNil(url)
    }
    
    func testHeroeDescripcion() {
        XCTAssertNotNil(heroe.description)
        XCTAssertEqual(heroe.description, "Goku always wins!!!")
        XCTAssertNotEqual(heroe.description, "Goku never wins")
    }
    
    func testHeroeFavorite() {
        XCTAssertNotNil(heroe.favorite)
        XCTAssertEqual(heroe.favorite, false)
        XCTAssertNotEqual(heroe.favorite, true)
    }

}
