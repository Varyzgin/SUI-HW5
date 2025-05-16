//
//  PostViewModel.swift
//  SUI-HW5
//
//  Created by Dim on 15.05.2025.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var post: PostModel
    init(post: PostModel) {
        self.post = post
    }
}
