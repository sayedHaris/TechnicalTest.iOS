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
       
       

    
    


}
