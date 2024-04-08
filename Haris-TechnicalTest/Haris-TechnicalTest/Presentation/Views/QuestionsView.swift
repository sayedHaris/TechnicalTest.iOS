//
//  QuestionsView.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import Foundation
import SwiftUI


struct QuestionsView: View {
    @ObservedObject var viewModel = QuestionsViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText) // Add search bar

                if viewModel.isLoading {
                    ProgressView()
                } else {
                    List(viewModel.filteredQuestions(searchText: searchText)) { question in
                        NavigationLink(destination: QuestionDetailView(question: question)) {
                            VStack(alignment: .leading) {
                                Text("Difficulty: \(question.difficulty)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("Category: \(question.category)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text(question.question)
                                    .font(.headline)
                            }
                        }
                    }
                    .navigationTitle("Questions")
                }
                Spacer()
            }
            .onAppear {
                if viewModel.questions.isEmpty {
                    viewModel.fetchQuestions()
                }
            }
        }
    }
}
struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = QuestionsViewModel()
        viewModel.fetchSampleQuestions() 
        return QuestionsView(viewModel: viewModel)
    }
}
extension QuestionsViewModel {
    func fetchSampleQuestions() {
        self.questions = [
            Question(question: "Question 1", category: "Category 1", difficulty: "easy", correctAnswer: "Answer 1", incorrectAnswers: ["Wrong answer 1", "Wrong answer 2"], type: "multiple"),
            Question(question: "Question 2", category: "Category 2", difficulty: "medium", correctAnswer: "Answer 2", incorrectAnswers: ["Wrong answer 3", "Wrong answer 4"], type: "multiple"),
            Question(question: "Question 3", category: "Category 3", difficulty: "hard", correctAnswer: "Answer 3", incorrectAnswers: ["Wrong answer 5", "Wrong answer 6"], type: "multiple")
        ]
    }
}
