//
//  Question.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import Foundation

struct Question: Codable,Identifiable {
    let id = UUID() 
    let difficulty: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    let type: String
    let category: String
    let question: String
    init(question: String, category: String, difficulty: String, correctAnswer: String, incorrectAnswers: [String], type: String) {
           self.question = question
           self.category = category
           self.difficulty = difficulty
           self.correctAnswer = correctAnswer
           self.incorrectAnswers = incorrectAnswers
           self.type = type
       }
    init?(dict: [String: Any]) {
            guard let questionText = dict["question"] as? String,
                  let category = dict["category"] as? String,
                  let type = dict["type"] as? String,
                  let difficulty = dict["difficulty"] as? String,
                  let correctAnswer = dict["correct_answer"] as? String,
                  let incorrectAnswers = dict["incorrect_answers"] as? [String] else {
                return nil
            }
            
            self.question = questionText
            self.category = category
            self.difficulty = difficulty
            self.type = type
            self.correctAnswer = correctAnswer
            self.incorrectAnswers = incorrectAnswers
        }
    enum CodingKeys: String, CodingKey {
        case difficulty
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        case type
        case category
        case question
    }
    
}
