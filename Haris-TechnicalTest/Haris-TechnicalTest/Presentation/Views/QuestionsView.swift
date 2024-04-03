//
//  QuestionsView.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import Foundation
import SwiftUI

struct QuestionsView: View {
    let questions: [String] // Array to hold questions
    
    var body: some View {
        NavigationView {
            List(questions, id: \.self) { question in
                NavigationLink(destination: QuestionDetailView(question: question)) {
                    Text(question)
                }
            }
            .navigationTitle("Questions")
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        let questions = ["What is your favorite color?", "What is the capital of France?", "What is 2 + 2?"]
        QuestionsView(questions: questions)
    }
}
