//
//  PostViewModel.swift
//  SUI-HW5
//
//  Created by Dim on 15.05.2025.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var model: PostModel
    
    init(post: PostModel) {
        self.model = post
    }
    
    func Rus(number toDosCount: Int, oneTwoMore: String...) -> String {
        if toDosCount % 10 == 1 && toDosCount % 100 != 11 {
            return "\(toDosCount) \(oneTwoMore[0])"
        } else if (toDosCount % 10 == 2 || toDosCount % 10 == 3 || toDosCount % 10 == 4)
                    && toDosCount % 100 != 12 && toDosCount % 100 != 13 && toDosCount % 100 != 14 {
            return "\(toDosCount) \(oneTwoMore[1])"
        } else {
            return "\(toDosCount) \(oneTwoMore[2])"
        }
    }
}
