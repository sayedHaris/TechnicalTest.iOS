//
//  NetworkManager.swift
//  Haris-TechnicalTest
//
//  Created by Sayed Haris on 02/04/2024.
//

import Foundation

//class NetworkManager {
//    static let shared = NetworkManager()
//    
//    func fetchQuestions(completion: @escaping ([String]?, Error?) -> Void) {
//        guard let url = URL(string: "https://opentdb.com/api.php?amount=15") else {
//            completion(nil, NSError(domain: "InvalidURL", code: 0, userInfo: nil))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//            
//            guard let data = data else {
//                completion(nil, NSError(domain: "NoData", code: 0, userInfo: nil))
//                return
//            }
//            
//            // Parse the JSON data into an array of strings (questions)
////            do {
////                let questions = try JSONDecoder().decode([String].self, from: data)
////                completion(questions, nil)
////            } catch {
////                completion(nil, error)
////            }
//            do {
//                if let array = try JSONSerialization.jsonObject(with: data, options: []) as? [String] {
//                    // If the response is an array, use it directly
//                    completion(array, nil)
//                } else if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                    // If the response is a dictionary, extract the array from it
//                    if let questions = dictionary["questions"] as? [String] {
//                        completion(questions, nil)
//                    } else {
//                        completion(nil, NSError(domain: "InvalidData", code: 0, userInfo: nil))
//                    }
//                } else {
//                    completion(nil, NSError(domain: "InvalidData", code: 0, userInfo: nil))
//                }
//            } catch {
//                completion(nil, error)
//            }
//        }.resume()
//    }
//}
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
            
//            do {
//                let decodedData = try JSONDecoder().decode([String: [Question]].self, from: data)
//                let questions = decodedData["results"] // Extracting the questions array
//                completion(questions, nil)
//            } catch {
//                completion(nil, error)
//            }
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
