//
//  File.swift
//  
//
//  Created by Paul Matar on 13/08/2023.
//

import Foundation

struct ArticleResponse: Decodable {
    let totalResults: Int
    let articles: [ArticleRemote]
    
    var toDomain: [Article] {
        articles.map { $0.toDomain }
    }
}
