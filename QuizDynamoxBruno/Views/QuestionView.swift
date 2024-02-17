//
//  QuestionView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 16/02/24.
//

import SwiftUI

struct QuestionView: View {
    let question: Question
    let onNextQuestion: (Bool) -> Void
    @State private var selectedAnswer: String = ""
    
    var body: some View {
        VStack {
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
        }
    }
    
    func postAnswer() {
        APIManager.shared.postAnswer(questionId: question.id, answer: selectedAnswer) { result in
            switch result {
            case .success(let isCorrect):
                DispatchQueue.main.async {
                    onNextQuestion(isCorrect)
                }
            case .failure(let error):
                print("Error posting answer: \(error.localizedDescription)")
            }
        }
    }
}
