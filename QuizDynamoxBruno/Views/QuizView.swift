//
//  QuizView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 15/02/24.
//

import SwiftUI

struct QuizView: View {
    @State private var question: Question?
    @State private var selectedAnswer: String = ""
    
    var body: some View {
        VStack {
            if let question = question {
                Text(question.statement)
                    .padding()
                Spacer()
                VStack(alignment: .leading) {
                    ForEach(question.options, id: \.self) { option in
                        Button(action: {
                            selectedAnswer = option
                            postAnswer()
                        }) {
                            Text(option)
                                .padding()
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            fetchQuestion()
        }
    }
    
    func fetchQuestion() {
        APIManager.shared.fetchQuestion { result in
            switch result {
            case .success(let question):
                self.question = question
            case .failure(let error):
                print("Error fetching question: \(error.localizedDescription)")
            }
        }
    }
    
    func postAnswer() {
        guard let questionId = question?.id else {
            return
        }
        APIManager.shared.postAnswer(questionId: questionId, answer: selectedAnswer) { result in
            switch result {
            case .success(let isCorrect):
                if isCorrect {
                    print("Resposta correta!")
                    // Lógica para lidar com a resposta correta
                } else {
                    print("Resposta incorreta!")
                    // Lógica para lidar com a resposta incorreta
                }
            case .failure(let error):
                print("Error posting answer: \(error.localizedDescription)")
            }
        }
    }
}


#Preview {
    QuizView()
}
