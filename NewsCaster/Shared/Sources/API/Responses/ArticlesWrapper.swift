//
//  File.swift
//  
//
//  Created by Paul Matar on 05/08/2023.
//

import Foundation

public struct ArticlesWrapper: Decodable {
    public let totalResults: Int
    public let articles: [ArticleResponse]
}


