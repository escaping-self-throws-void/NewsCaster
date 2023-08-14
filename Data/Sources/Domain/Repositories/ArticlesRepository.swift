//
//  ArticlesRepository.swift
//  
//
//  Created by Paul Matar on 12/08/2023.
//

import Foundation
import Utilities
import Networking
import Logs

public struct ArticlesRepository: Repository {
    @Injected private var network: Networking
    private var articles = [Article]()
    
    public init() {}
    
    public func get(_ count: Int) async -> [Article] {
        do {
            return try await fetch(count)
        } catch {
            Logs<Self>.log(error)
            return []
        }
    }
    
    private func fetch(_ count: Int) async throws -> [Article] {
        let request = TopHeadlinesRequest.usaTop(count)
        let data: ArticleResponse = try await network.perform(request)
        let articles = data.toDomain
        return articles
    }
}
