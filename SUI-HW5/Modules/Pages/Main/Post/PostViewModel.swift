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
    
    func endingsRussification(number: Int, definition: (one: String, from2To4: String, more: String)) -> String {
        if number % 10 == 1 && number % 100 != 11 {
            return "\(number) \(definition.one)"
        } else if (number % 10 == 2 || number % 10 == 3 || number % 10 == 4)
                    && number % 100 != 12 && number % 100 != 13 && number % 100 != 14 {
            return "\(number) \(definition.from2To4)"
        } else {
            return "\(number) \(definition.more)"
        }
    }
}
