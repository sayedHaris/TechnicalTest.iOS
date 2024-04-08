//
//  QuestionDetailView.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import SwiftUI

struct QuestionDetailView: View {
    let question: Question
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question.question)
                .font(.title)
                .padding(.bottom, 5)
            Text("Category: \(question.category)")
                .padding(.bottom, 5)
            Text("Difficulty: \(question.difficulty)")
                .padding(.bottom, 5)
            HStack {
                Text("Type:")
                Spacer()
                Badge(text: question.type == "boolean" ? "Boolean" : "Multiple Choice")
            }
            .padding(.bottom, 5)
            Text("Correct Answer: \(question.correctAnswer)")
                .padding(.bottom, 5)
            Text("Incorrect Answers: \(question.incorrectAnswers.joined(separator: ", "))")
                .padding(.bottom, 5)
        }
        .padding()
        .navigationTitle("Question Details")
    }
}

struct Badge: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
            .background(Color.blue)
            .cornerRadius(8)
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
