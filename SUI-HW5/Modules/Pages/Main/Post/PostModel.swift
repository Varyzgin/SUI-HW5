//
//  PostModel.swift
//  SUI-HW5
//
//  Created by Dim on 15.05.2025.
//

import Foundation

struct PostModel: Identifiable {
    let id: String = UUID().uuidString
    let photoesCount: Int
    let commentsCount: Int
    let tags: [String]
    let text: String
    let imageResource: String
}
