//
//  ResultView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 16/02/24.
//

import SwiftUI

struct ResultView: View {
    let score: Int
    let restartQuiz: () -> Void
    
    var body: some View {
        VStack {
            Text("Parabéns!")
                .brownColorTitle()
                .padding(.bottom, 20)
            Text("Sua pontuação foi: \(score)/10")
                .foregroundStyle(Color("AccentColor"))
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            Button("Reiniciar Quiz") {
                restartQuiz()
            }
            .foregroundStyle(.white)
            .padding()
            .padding(.horizontal)
            .background(Color("AccentColor"))
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
    }
}
