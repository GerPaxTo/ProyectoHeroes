//
//  MovieTests.swift
//  TestingTests
//
//  Created by Gerardo Paxtian on 15/12/22.
//

import XCTest

final class MovieTests: XCTestCase {

    var movie: Movie!
    
    override func setUp()  {
        super.setUp()
        
        movie = Movie(title: "Titanic", year: "1997")
    }

    override func tearDown()  {
        movie = nil
        
        super.tearDown()
    }
    
    func testMovieTitle(){
        // Given
        
        // When
        let title = movie.title
        
        // Then
        XCTAssertNotNil(movie)
        XCTAssertNotNil(title)
        XCTAssertNotNil(title, "Titanic")
    }

    func test_movie_test(){
        // Given
        
        // When
        let year = movie.year
        
        // Then
        XCTAssertNotNil(year)
        XCTAssertEqual(year,"1977")
        XCTAssertFalse(year == "1974")
    }
}
