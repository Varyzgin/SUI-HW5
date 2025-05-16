//
//  DetailsPageViewModel.swift
//  SUI-HW5
//
//  Created by Dim on 16.05.2025.
//

import Foundation

class DetailsPageViewModel: ObservableObject {
    @Published var detailedPost: DetailsPageModel
    
    init(post: PostModel) {
        self.detailedPost = DetailsPageModel(pictures: [post.imageResource], tags: post.tags, text: post.text)
        self.detailedPost.date = "16 декабря"
        self.detailedPost.year = "2024 год"
        
        self.detailedPost.coments = [
            DetailsPageModel.Coment(date: "16.12.23", text: "Lorem ipsum dolor sit amet"),
            DetailsPageModel.Coment(date: "17.12.23", text: "Lorem ipsum dolor sit amet ew;fjwn jenve jre"),
        ]
        self.detailedPost.pictures.append("poster1")
    }
}
