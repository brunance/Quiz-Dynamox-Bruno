//
//  QuestionsView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 14/02/24.
//

import SwiftUI

struct QuestionsView: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Quiz")
                    .accentColorTitle()
                Spacer()
                Text("1/10")
                    .foregroundStyle(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: 260)
            
            VStack (alignment: .leading, spacing: 20) {
                Text("pergunta importante aqui, omg??")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.gray))
    }
}

#Preview {
    QuestionsView()
}
