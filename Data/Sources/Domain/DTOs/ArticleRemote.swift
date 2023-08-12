//
//  ArticleRemote.swift
//  
//
//  Created by Paul Matar on 05/08/2023.
//

import Foundation
import Utilities

struct ArticleResponse: Decodable {
    let totalResults: Int
    let articles: [ArticleRemote]
    
    var toDomain: [Article] {
        articles.map { $0.toDomain }
    }
}

extension ArticleResponse {
    struct ArticleRemote: Decodable {
        let source: SourceRemote
        let author: String?
        let title: String
        let description: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String
        let content: String?
        
        var toDomain: Article {
            Article(
                author: author,
                title: title,
                description: description,
                url: URL(string: url ?? ""),
                urlToImage: URL(string: urlToImage ?? ""),
                publishedAt: ISO8601DateParser.parse(publishedAt),
                content: content
            )
        }
    }
}
