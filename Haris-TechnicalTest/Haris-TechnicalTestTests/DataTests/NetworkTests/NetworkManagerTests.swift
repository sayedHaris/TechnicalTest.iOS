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
        networkManager = MockNetworkManager()
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

class MockNetworkManager: NetworkManager {
    override func fetchQuestions(completion: @escaping ([Question]?, Error?) -> Void) {
        // Provide mock data for testing
        let mockQuestions = [
            Question(question: "Mock Question 1", category: "Mock Category 1", difficulty: "easy", correctAnswer: "Mock Answer 1", incorrectAnswers: ["Mock Wrong answer 1", "Mock Wrong answer 2"], type: "multiple"),
            Question(question: "Mock Question 2", category: "Mock Category 2", difficulty: "medium", correctAnswer: "Mock Answer 2", incorrectAnswers: ["Mock Wrong answer 3", "Mock Wrong answer 4"], type: "multiple")
        ]
        completion(mockQuestions, nil)
    }
}
