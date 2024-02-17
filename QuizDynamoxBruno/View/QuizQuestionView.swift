//
//  QuizQuestionView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 16/02/24.
//

import SwiftUI

struct QuizQuestionView: View {
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            if viewModel.currentQuestionIndex < viewModel.questions.count {
                let question = viewModel.questions[viewModel.currentQuestionIndex]
                QuestionView(questionNumber: viewModel.currentQuestionIndex + 1, totalQuestions: viewModel.questions.count, question: question, onNextQuestion: viewModel.nextQuestion)

            } else if viewModel.currentQuestionIndex == 10 {
                ResultView(score: viewModel.score, restartQuiz: viewModel.restartQuiz)
            }
        }
    }
}


//#Preview {
//    QuizQuestionView()
//}
