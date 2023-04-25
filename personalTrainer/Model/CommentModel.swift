//
//  CommentModel.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 18/04/23.
//

import Foundation

struct CommentModel: Identifiable, Hashable, Codable {
    let id = UUID()
    let code: String?
    let value: String
    let serie: Int?
    let ripetizioni: Int?
    let riposo: Int?
    let addRepetition: Bool
    let addWeigth: Bool
}
