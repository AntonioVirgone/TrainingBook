//
//  PostModel.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 18/04/23.
//

import Foundation

struct PostModel: Identifiable, Hashable, Codable {
    let id = UUID()
    let title: String
    let type: String
    let excercises: [CommentModel]
}
