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
                    Text("DynaQuiz")
                        .brownColorTitle()
                        .padding(.bottom, 20)
                    
                    Text("Teste seus conhecimentos e tente acertar o máximo que conseguir!")
                        .foregroundStyle(Color("AccentColor"))
                        .multilineTextAlignment(.center)
                    
                    TextField("Insira seu nome...", text: $viewModel.playerName)
                        .underlineTextField()
                        .padding(20)
                    
                    Button("Iniciar Quiz") {
                        if !viewModel.playerName.isEmpty {
                            viewModel.startQuiz()
                        } else {
                            isAlertPresented = true
                        }
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color("AccentColor"))
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                }
                .alert(isPresented: $isAlertPresented) {
                    Alert(title: Text("Nome Inválido"), message: Text("Por favor, insira um nome ou apelido."), dismissButton: .default(Text("OK")))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(Color(hex: "F6FBBF"))
    }
}
