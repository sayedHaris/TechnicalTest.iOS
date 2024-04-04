//
//  FetchQuestionsUseCaseTests.swift
//  Haris-TechnicalTestTests
//
//  Created by Sayed Haris on 02/04/2024.
//

import XCTest
@testable import Haris_TechnicalTest
final class FetchQuestionsUseCaseTests: XCTestCase {

    var viewModel: QuestionsViewModel!

       override func setUpWithError() throws {
           viewModel = QuestionsViewModel()
       }

       override func tearDownWithError() throws {
           viewModel = nil
       }

       func testFetchQuestionsSuccess() throws {
           // Given
           let expectedQuestions = [
               Question(question: "Question 1", category: "Category 1", difficulty: "easy", correctAnswer: "Answer 1", incorrectAnswers: ["Wrong answer 1", "Wrong answer 2"], type: "multiple"),
               Question(question: "Question 2", category: "Category 2", difficulty: "medium", correctAnswer: "Answer 2", incorrectAnswers: ["Wrong answer 3", "Wrong answer 4"], type: "multiple"),
               Question(question: "Question 3", category: "Category 3", difficulty: "hard", correctAnswer: "Answer 3", incorrectAnswers: ["Wrong answer 5", "Wrong answer 6"], type: "multiple"),Question(question: "Question 1", category: "Category 1", difficulty: "easy", correctAnswer: "Answer 1", incorrectAnswers: ["Wrong answer 1", "Wrong answer 2"], type: "multiple"),
               Question(question: "Question 2", category: "Category 2", difficulty: "medium", correctAnswer: "Answer 2", incorrectAnswers: ["Wrong answer 3", "Wrong answer 4"], type: "multiple"),
               Question(question: "Question 3", category: "Category 3", difficulty: "hard", correctAnswer: "Answer 3", incorrectAnswers: ["Wrong answer 5", "Wrong answer 6"], type: "multiple"),Question(question: "Question 1", category: "Category 1", difficulty: "easy", correctAnswer: "Answer 1", incorrectAnswers: ["Wrong answer 1", "Wrong answer 2"], type: "multiple"),
               Question(question: "Question 2", category: "Category 2", difficulty: "medium", correctAnswer: "Answer 2", incorrectAnswers: ["Wrong answer 3", "Wrong answer 4"], type: "multiple"),
               Question(question: "Question 3", category: "Category 3", difficulty: "hard", correctAnswer: "Answer 3", incorrectAnswers: ["Wrong answer 5", "Wrong answer 6"], type: "multiple"),Question(question: "Question 1", category: "Category 1", difficulty: "easy", correctAnswer: "Answer 1", incorrectAnswers: ["Wrong answer 1", "Wrong answer 2"], type: "multiple"),
               Question(question: "Question 2", category: "Category 2", difficulty: "medium", correctAnswer: "Answer 2", incorrectAnswers: ["Wrong answer 3", "Wrong answer 4"], type: "multiple"),
               Question(question: "Question 3", category: "Category 3", difficulty: "hard", correctAnswer: "Answer 3", incorrectAnswers: ["Wrong answer 5", "Wrong answer 6"], type: "multiple"),Question(question: "Question 1", category: "Category 1", difficulty: "easy", correctAnswer: "Answer 1", incorrectAnswers: ["Wrong answer 1", "Wrong answer 2"], type: "multiple"),
               Question(question: "Question 2", category: "Category 2", difficulty: "medium", correctAnswer: "Answer 2", incorrectAnswers: ["Wrong answer 3", "Wrong answer 4"], type: "multiple"),
               Question(question: "Question 3", category: "Category 3", difficulty: "hard", correctAnswer: "Answer 3", incorrectAnswers: ["Wrong answer 5", "Wrong answer 6"], type: "multiple"),
           ]
           
           // When
           viewModel.fetchQuestions()
           
           // Then
           XCTAssertEqual(viewModel.questions.count, expectedQuestions.count)
           XCTAssertEqual(viewModel.questions, expectedQuestions)
       }
       
       func testFetchQuestionsFailure() throws {
           // In this test case, you can simulate a failure scenario and ensure that the viewModel handles it correctly.
           // For example, you can mock a network manager that always returns an error, and verify that the viewModel's error handling works as expected.
       }
   

//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    
    


}
