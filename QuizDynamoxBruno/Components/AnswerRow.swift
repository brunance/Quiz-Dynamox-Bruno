////
////  AnswerRow.swift
////  QuizDynamoxBruno
////
////  Created by Bruno França do Prado on 14/02/24.
////
//
//import SwiftUI
//
//struct AnswerRow: View {
//    var question: Question
//    @State private var isSelected = false
//    
//    var body: some View {
//        HStack(spacing: 20) {
//            Image(systemName: "circle.fill")
//                .font(.caption)
//            Text(question.statement)
//                .bold()
//            if isSelected {
//                Spacer()
//                Image(systemName: question.isAnswerCorrect ? "checkmark.circle.fill" : "x.circle.fill")
//                    .foregroundColor(answer.isAnswerCorrect ? Color.green : Color.red)
//            }
//        }
//        .padding()
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: . leading)
//        .foregroundColor(isSelected ?  Color("AccentColor") : .gray)
//        .background(.white)
//        .cornerRadius(10)
//        .shadow(color: isSelected ? (answer.isAnswerCorrect ? .green : .red) : .gray, radius: 5, x: 0.5, y: 0.5)
//        .onTapGesture {
//            isSelected = true
//        }
//    }
//}
//
//#Preview {
//    AnswerRow(answer: Answer(text: "teste", isAnswerCorrect: false))
//}
