//
//  QuestionDetailView.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import SwiftUI

//struct QuestionDetailView: View {
//    let question: String // The selected question
//    
//    var body: some View {
//        VStack {
//            Text(question)
//                .font(.title)
//                .padding()
//            // Add more details of the question here as needed
//        }
//        .navigationTitle("Question Details")
//    }
//}
//
//struct QuestionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionDetailView(question: "What is your favorite color?")
//    }
//}
struct QuestionDetailView: View {
    let question: Question // The selected question
    
    var body: some View {
        VStack {
            Text(question.question)
                .font(.title)
                .padding()
            Text("Category: \(question.category)")
                .padding()
            Text("Difficulty: \(question.difficulty)")
                .padding()
            Text("Type: \(question.type)")
                .padding()
            Text("Correct Answer: \(question.correctAnswer)")
                .padding()
            Text("Incorrect Answers: \(question.incorrectAnswers.joined(separator: ", "))")
                .padding()
            // Add more details of the question here as needed
        }
        .navigationTitle("Question Details")
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleQuestion = Question(question: "What is your favorite color?", category: "General Knowledge", difficulty: "easy", correctAnswer: "Blue", incorrectAnswers: ["Red", "Green", "Yellow"], type: "multiple")
        NavigationView {
            QuestionDetailView(question: sampleQuestion)
        }
    }
}
