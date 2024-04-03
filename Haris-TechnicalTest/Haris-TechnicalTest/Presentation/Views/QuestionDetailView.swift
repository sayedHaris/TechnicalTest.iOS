//
//  QuestionDetailView.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import SwiftUI

struct QuestionDetailView: View {
    let question: String // The selected question
    
    var body: some View {
        VStack {
            Text(question)
                .font(.title)
                .padding()
            // Add more details of the question here as needed
        }
        .navigationTitle("Question Details")
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(question: "What is your favorite color?")
    }
}
