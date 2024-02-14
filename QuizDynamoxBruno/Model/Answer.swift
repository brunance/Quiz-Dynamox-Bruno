//
//  Answer.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 14/02/24.
//

import Foundation
import SwiftUI

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isAnswerCorrect: Bool
}
