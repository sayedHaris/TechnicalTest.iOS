//
//  QuestionsViewModel.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import Foundation

//class QuestionsViewModel: ObservableObject {
//    @Published var questions: [String] = []
//    @Published var isLoading: Bool = false
//    
//    func fetchQuestions() {
//        isLoading = true
//        NetworkManager.shared.fetchQuestions { [weak self] result, error in
//            guard let self = self else { return }
//            DispatchQueue.main.async {
//                self.isLoading = false
//                if let error = error {
//                    print("Error fetching questions: \(error)")
//                } else {
//                    self.questions = result ?? []
//                }
//            }
//        }
//    }
//}
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
}
