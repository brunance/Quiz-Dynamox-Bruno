//
//  ContentView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuizViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isQuizActive {
                QuizQuestionView(viewModel: viewModel)
            } else {
                VStack {
                    TextField("Nome ou Apelido", text: $viewModel.playerName)
                        .padding()
                    Button("Iniciar Quiz") {
                        viewModel.startQuiz()
                    }
                    .padding()
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
