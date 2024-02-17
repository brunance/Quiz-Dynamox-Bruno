//
//  ContentView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 14/02/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var playerName = ""
    @State private var isQuizActive = false
    @State private var questions = [Question]()
    @State private var currentQuestionIndex = 0
    @State private var score = 0
    
    var body: some View {
        VStack {
            if isQuizActive {
                if currentQuestionIndex < questions.count {
                    QuizQuestionView(question: questions[currentQuestionIndex], onNextQuestion: nextQuestion)
                } else {
                    ResultView(score: score, restartQuiz: restartQuiz)
                }
            } else {
                VStack {
                    TextField("Nome ou Apelido", text: $playerName)
                        .padding()
                    Button("Iniciar Quiz") {
                        startQuiz()
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
    
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


//#Preview {
//    ContentView()
//}
