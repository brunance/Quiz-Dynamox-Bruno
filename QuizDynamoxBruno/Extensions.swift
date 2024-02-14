//
//  Extensions.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 14/02/24.
//

import Foundation
import SwiftUI

extension Text {
    func accentColorTitle() -> some View {
        self
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.heavy)
            .foregroundStyle(Color("AccentColor"))
    }
}
