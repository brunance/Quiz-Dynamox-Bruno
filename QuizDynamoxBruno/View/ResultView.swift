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
                .font(.title)
                .padding()
            Text("Sua pontuação: \(score)/10")
                .padding()
            Button("Reiniciar Quiz") {
                restartQuiz()
            }
            .padding()
        }
    }
}
