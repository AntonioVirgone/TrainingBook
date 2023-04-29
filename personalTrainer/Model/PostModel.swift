//
//  PostModel.swift
//  personalTrainer
//
//  Created by Antonio Virgone on 18/04/23.
//

import Foundation

struct PostModel: Hashable, Codable {
    let title: String
    let type: String
    let excercises: [CommentModel]
}
