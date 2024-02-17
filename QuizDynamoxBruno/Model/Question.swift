//
//  Question.swift
//  QuizDynamoxBruno
//
//  Created by Bruno França do Prado on 16/02/24.
//

import Foundation

struct Question: Codable {
    var id: String
    var statement: String
    var options: [String]
}
