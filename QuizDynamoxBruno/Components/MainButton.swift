//
//  MainButton.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 14/02/24.
//

import SwiftUI

struct MainButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    
    var body: some View {
        Text(text)
            .foregroundStyle(.black)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MainButton(text: "Próximo")
}
