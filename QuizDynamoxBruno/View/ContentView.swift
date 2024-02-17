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
    @State private var keyboardHeight: CGFloat = 0
    
    var body: some View {
        VStack {
            if viewModel.isQuizActive {
                QuizQuestionView(viewModel: viewModel)
            } else {
                VStack {
                    Image("DynaLogo")
                        .padding(.bottom, 20)
                    
                    Text("DynaQuiz")
                        .brownColorTitle()
                        .padding(.bottom, 20)
                    
                    Text("Teste seus conhecimentos e tente acertar o máximo que conseguir!")
                        .foregroundStyle(Color("AccentColor"))
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 50)
                    
                    TextField("Insira seu nome...", text: $viewModel.playerName)
                        .underlineTextField()
                        .padding(20)
                        .onTapGesture {
                            viewModel.hideKeyboard()
                                        }
                    
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
                .padding(.bottom, keyboardHeight) // Move the VStack up when the keyboard is present
                        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                            guard let keyboardSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                            withAnimation {
                                keyboardHeight = keyboardSize.height
                            }
                        }
                        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                            withAnimation {
                                keyboardHeight = 0
                            }
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
