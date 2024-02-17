//
//  ContentView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = QuizViewModel()
    @State private var isAlertPresented = false
    
    var body: some View {
        VStack {
            if viewModel.isQuizActive {
                QuizQuestionView(viewModel: viewModel)
            } else {
                VStack {
                    TextField("Nome ou Apelido", text: $viewModel.playerName)
                        .padding()
                    Button("Iniciar Quiz") {
                        if !viewModel.playerName.isEmpty {
                            viewModel.startQuiz()
                        } else {
                            isAlertPresented = true
                        }
                    }
                }
                .alert(isPresented: $isAlertPresented) {
                    Alert(title: Text("Nome Inválido"), message: Text("Por favor, insira um nome ou apelido."), dismissButton: .default(Text("OK")))
                }
            }
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
