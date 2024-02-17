//
//  APIManager.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 16/02/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    let baseURL = "https://quiz-api-bwi5hjqyaq-uc.a.run.app"
    
    func fetchQuestion(completion: @escaping (Result<Question, Error>) -> Void) {
        let questionURL = URL(string: "\(baseURL)/question")!
        URLSession.shared.dataTask(with: questionURL) { data, response, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                let question = try JSONDecoder().decode(Question.self, from: data)
                completion(.success(question))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func postAnswer(questionId: String, answer: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        let answerURL = URL(string: "\(baseURL)/answer?questionId=\(questionId)")!
        var request = URLRequest(url: answerURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let requestBody = ["answer": answer]
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            do {
                let result = try JSONDecoder().decode([String: Bool].self, from: data)
                if let isCorrect = result["result"] {
                    completion(.success(isCorrect))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
