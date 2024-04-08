//
//  QuestionsViewModel.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import Foundation

class QuestionsViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @Published var isLoading: Bool = false
    private var isDataFetched = false

    func fetchQuestions() {
        guard !isDataFetched else { return }

        isLoading = true
        NetworkManager.shared.fetchQuestions { [weak self] result, error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
                self.isDataFetched = true
                if let error = error {
                    print("Error fetching questions: \(error)")
                } else {
                    self.questions = result ?? []
                }
            }
        }
    }
    
    func filteredQuestions(searchText: String) -> [Question] {
            if searchText.isEmpty {
                return questions // Return all questions if search text is empty
            } else {
                // Filter questions based on search text
                return questions.filter { $0.question.localizedCaseInsensitiveContains(searchText) }
            }
        }
}
