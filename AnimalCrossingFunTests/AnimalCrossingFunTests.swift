//
//  AnimalCrossingFunTests.swift
//  AnimalCrossingFunTests
//
//  Created by Philip Martin on 18/05/2022.
//

import XCTest
@testable import AnimalCrossingFun

class AnimalCrossingFunTests: XCTestCase, ACCritterListViewModelOutput {
    
    var expectation: XCTestExpectation?
    var critterResponse: CritterResponseModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        critterResponse = nil
    }
    
    func testAPIIntegration() {
        let viewModel = ACCritterListViewModel()
        viewModel.output = self
        viewModel.fetch(critterType: ACCritterType.fish)
        expectation = expectation(description: "Fetch Critter")
        waitForExpectations(timeout: 1)
        do {
            let result = try XCTUnwrap(critterResponse)
            XCTAssertEqual(result.name.nameEUen, "bitterling")
        } catch {
            XCTFail("Do catch failed")
        }
    }
    
    func contentRecieved(model: [CritterResponseModel]) {
        critterResponse = model.first
        expectation?.fulfill()
        expectation = nil
    }
    
    func requestFailed(error: String) {
        
    }
}
