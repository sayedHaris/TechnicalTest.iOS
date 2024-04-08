//
//  NetworkManagerTests.swift
//  Haris-TechnicalTestTests
//
//  Created by Sayed Haris on 08/04/2024.
//

import XCTest
@testable import Haris_TechnicalTest

class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager!

    override func setUpWithError() throws {
        networkManager = NetworkManager()
    }

    override func tearDownWithError() throws {
        networkManager = nil
    }

    func testFetchQuestions() throws {
        let expectation = XCTestExpectation(description: "Fetch questions from the network")

        networkManager.fetchQuestions { questions, error in
            if let questions = questions {
                XCTAssertNotNil(questions, "Fetched questions should not be nil")
            } else if let error = error {
                XCTFail("Error fetching questions: \(error.localizedDescription)")
            }

            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)
    }

    // Add more network tests as needed for testing other functionalities

}
