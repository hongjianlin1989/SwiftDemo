//
//  SwiftDemoTests.swift
//  SwiftDemoTests
//
//  Created by hongjian lin on 4/4/17.
//  Copyright © 2017 com.Tocaboca. All rights reserved.
//

import XCTest
@testable import SwiftDemo

class SwiftDemoTests: XCTestCase {
    
    let movieService = MovieService.init() as MovieService
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testRankApi() {
        let completionExpectation = self.expectation(description: "No success returned")
        let movieRequest = MovieRequest.init(startRankIndex: 5, numMovies: 5)
        self.movieService.getRankListOfMovieWithRequest(req: movieRequest) { (Arr) in
            XCTAssertNotNil(Arr , "The result is nil")
            completionExpectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
