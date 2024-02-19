//
//  QuestionView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 16/02/24.
//

import SwiftUI

struct QuestionView: View {
    let questionNumber: Int
    let totalQuestions: Int
    let question: Question
    let onNextQuestion: (Bool) -> Void
    @State private var selectedAnswer: String = ""
    @State private var answerStatusMessage: String?
    @State private var isAnswered = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("DynaQuiz")
                        .brownColorTitle()
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Text("Questão \(questionNumber) de \(totalQuestions)")
                        .foregroundStyle(Color("AccentColor"))
                        .fontWeight(.heavy)
                        .padding(.trailing, 20)
                }
                
                Text(question.statement)
                    .foregroundStyle(.white)
                    .padding(20)
                    .background(Color("AccentColor"))
                
                
                ScrollView {
                    VStack {
                        ForEach(question.options, id: \.self) { option in
                            Button(action: {
                                if !isAnswered {
                                    selectedAnswer = option
                                    isAnswered = true
                                    postAnswer()
                                }
                            }) {
                                Text(option)
                                    .padding()
                                    .border(Color("AccentColor"))
                            }
                            .disabled(isAnswered)
                        }
                    }
                }
                .padding(.top, 20)
                .frame(width: 300, height: 400)
            }
            
            VStack {
                if let answerStatusMessage = answerStatusMessage {
                    Text(answerStatusMessage)
                        .foregroundColor(answerStatusMessage.contains("Resposta correta!") ? .green : .red)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                self.answerStatusMessage = nil
                                onNextQuestion(answerStatusMessage.contains("Resposta correta!"))
                                self.isAnswered = false
                            }
                        }
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .fontWeight(.heavy)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 50)
        }
        
    }
    
    func postAnswer() {
        APIManager.shared.postAnswer(questionId: question.id, answer: selectedAnswer) { result in
            switch result {
            case .success(let isCorrect):
                DispatchQueue.main.async {
                    answerStatusMessage = isCorrect ? "Resposta correta!" : "Resposta incorreta!"
                }
            case .failure(let error):
                print("Error posting answer: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    answerStatusMessage = "Erro ao verificar a resposta."
                }
            }
        }
    }
}
