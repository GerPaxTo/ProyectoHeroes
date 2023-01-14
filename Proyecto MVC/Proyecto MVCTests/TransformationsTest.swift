//
//  transformationsTest.swift
//  Proyecto MVCUITests
//
//  Created by Gerardo Paxtian on 21/12/22.
//

import XCTest
@testable import Proyecto_MVC

final class transformationsTest: XCTestCase {
    
    var trans: Transformations!

    override func setUp() {
        super.setUp()
        
        trans = Transformations(id: "22",
                     name: "Super Sayayin",
                     photo: "https://www.keepcodig.io",
                     description: "Super Sayayin!!!")
    }

    override func tearDown()  {
        super.tearDown()
    }

    func testTransformationId() {
        XCTAssertNotNil(trans.id)
        XCTAssertEqual(trans.id, "22")
        XCTAssertNotEqual(trans.id, "7")
    }
    
    func testTransformationName() {
        XCTAssertNotNil(trans.name)
        XCTAssertEqual(trans.name, "Super Sayayin")
        XCTAssertNotEqual(trans.id, "Vegeta")
    }
    
    func testTransformationPhoto() {
        let url = URL(string:  trans.photo)
        XCTAssertNotNil(trans.photo)
        XCTAssertEqual(trans.photo, "https://www.keepcodig.io")
        XCTAssertNotEqual(trans.photo, "https://www.keepcodig.com")
        
        XCTAssertNotNil(url)
    }
    
    func testTransformationDescripcion() {
        XCTAssertNotNil(trans.description)
        XCTAssertEqual(trans.description, "Super Sayayin!!!")
        XCTAssertNotEqual(trans.description, "Goku never wins")
    }
}
