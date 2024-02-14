//
//  ContentView.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 14/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40){
            VStack(spacing: 20){
                Text("Testando QUiz Aquui")
                    .accentColorTitle()
                
                Text("Insira seu nome abaixo para começar")
                
            //Inserir caixa de texto para username
            }
            
            MainButton(text: "Começar aqui")
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .background(Color(.gray))
    }
}

#Preview {
    ContentView()
}
