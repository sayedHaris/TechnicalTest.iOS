//
//  NetworkManager.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager() // Singleton instance
    
    func fetchQuestions(completion: @escaping ([Question]?, Error?) -> Void) {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=15") else {
            completion(nil, NSError(domain: "InvalidURL", code: 0, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "NoData", code: 0, userInfo: nil))
                return
            }
            
            do {
                guard let decodedData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                      let results = decodedData["results"] as? [[String: Any]] else {
                    completion(nil, NSError(domain: "InvalidData", code: 0, userInfo: nil))
                    return
                }
                
                var questions = [Question]()
                for result in results {
                    if let question = Question(dict: result) {
                        questions.append(question)
                    }
                }
                
                completion(questions, nil)
            } catch {
                completion(nil, error)
            }

        }.resume()
    }
}
