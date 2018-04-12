//
//  yotpoUsageExampleTests.swift
//  yotpoUsageExampleTests
//
//  Created by Liliane Lima on 12/04/17.
//  Copyright © 2017 Liliane Lima. All rights reserved.
//

import XCTest
import yotpoKit

@testable import yotpoUsageExample

class yotpoUsageExampleTests: XCTestCase {
    var yotpo: Yotpo!
    let filters = RequestYotpo.Filters(sort: "rating", direction: "Desc")
    let timeout = 20.0
    
    //TODO: implement mocked API returns instead of requesting the real service
    override func setUp() {
        super.setUp()
        // Remember to enter official appKey and secretKey before testing
        let appKey = ""
        let secretKey = ""
        yotpo = APIYotpo(appK: appKey, clientS: secretKey).yotpo
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testProduct1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Get review for product 1")
        
        let id = "20011104"
        let result = 4.4285699999999997
        yotpo.myReview.getReviews(productId: id, filters: filters) { (code, msg, reviews) in
            XCTAssertEqual(reviews?.bottomLine.averageScore, result, "Result didn't match")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testProduct2() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Get review for product 2")
        
        let id = "20010469"
        let result = 4.0
        yotpo.myReview.getReviews(productId: id, filters: filters) { (code, msg, reviews) in
            XCTAssertEqual(reviews?.bottomLine.averageScore, result, "Result didn't match")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testProduct3() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Get review for product 3")
        
        let id = "20010970"
        let result = 4.3333300000000001
        yotpo.myReview.getReviews(productId: id, filters: filters) { (code, msg, reviews) in
            XCTAssertEqual(reviews?.bottomLine.averageScore, result, "Result didn't match")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
    func testProduct4() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Get review for product 4")
        
        let id = "20010526"
        let result = 4.3333300000000001
        yotpo.myReview.getReviews(productId: id, filters: filters) { (code, msg, reviews) in
            XCTAssertEqual(reviews?.bottomLine.averageScore, result, "Result didn't match")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: timeout)
    }
    
}
