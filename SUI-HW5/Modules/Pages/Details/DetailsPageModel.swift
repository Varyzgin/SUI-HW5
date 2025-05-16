//
//  DetailsPageModel.swift
//  SUI-HW5
//
//  Created by Dim on 14.05.2025.
//

import Foundation

struct DetailsPageModel: Identifiable, Hashable {
    let id: String = UUID().uuidString
    var date: String? = nil
    var year: String? = nil
    var pictures: [String]
    var tags: [String]
    var text: String
    var coments: [Coment]? = nil
    
    struct Coment: Hashable {
        var date: String
        var text: String
    }
}
