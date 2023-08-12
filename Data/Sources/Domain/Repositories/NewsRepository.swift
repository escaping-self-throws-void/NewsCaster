//
//  File.swift
//  
//
//  Created by Paul Matar on 12/08/2023.
//

import Foundation
import Utilities
import Networking

public struct NewsRepository {
    @Injected private var network: Networking
    
    public init() {}
    
    public func getTopHeadlines(_ count: Int) async throws -> [Article] {
        let request = TopHeadlinesRequest.usaTop(count)
        let data: ArticleResponse = try await network.perform(request)
        let articles = data.toDomain
        return articles
    }
}
