//
//  Esercizio.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 13/04/23.
//

import Foundation
struct Esercizio: Identifiable, Hashable, Codable {
    let code: String?
    let value: String
    let serie: Int?
    let ripetizioni: Int?
    let riposo: Int?
    var id = UUID()
}
