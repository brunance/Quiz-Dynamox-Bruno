//
//  QuizViewModel.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 16/02/24.
//

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var playerName = ""
    @Published var questions = [Question]()
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var isQuizActive = false
    
    func startQuiz() {
        isQuizActive = true
        fetchQuestions()
    }
    
    func fetchQuestions() {
        for _ in 0..<10 {
            APIManager.shared.fetchQuestion { result in
                switch result {
                case .success(let question):
                    DispatchQueue.main.async {
                        self.questions.append(question)
                    }
                case .failure(let error):
                    print("Error fetching question: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func nextQuestion(isCorrect: Bool) {
        if isCorrect {
            score += 1
        }
        currentQuestionIndex += 1
    }
    
    func restartQuiz() {
        playerName = ""
        isQuizActive = false
        questions.removeAll()
        currentQuestionIndex = 0
        score = 0
    }
}

