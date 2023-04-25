//
//  Scheda.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 13/04/23.
//

import Foundation

struct Scheda: Identifiable, Hashable, Codable {
    let title: String
    let excercises: [Esercizio]
    var id = UUID()
}
