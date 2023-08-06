//
//  ArticleRemote.swift
//  
//
//  Created by Paul Matar on 05/08/2023.
//

import Foundation

public struct ArticleRemote: Decodable {
    public let source: SourceRemote
    public let author: String?
    public let title: String
    public let description: String?
    public let url: String?
    public let urlToImage: String?
    public let publishedAt: String
    public let content: String?
}

public extension ArticleRemote {
    struct ArticleResponse: Decodable {
        public let totalResults: Int
        public let articles: [ArticleRemote]
    }
}
