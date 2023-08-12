//
//  MockResponse.swift
//  
//
//  Created by Paul Matar on 12/08/2023.
//

import Foundation

public struct MockResponse: Decodable {
    public let totalResults: Int
    public let articles: [MockArticle]
}

public extension MockResponse {
    struct MockArticle: Decodable {
        public let author: String?
    }
}
