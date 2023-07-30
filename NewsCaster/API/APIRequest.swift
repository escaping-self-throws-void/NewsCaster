//
//  APIRequest.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public protocol APIRequest: NetworkRequest { }

public extension APIRequest {
    var baseURL: URL {
        URL(string: "https://meme-api.com")!
    }
    var queryParams: [String: Any]? { nil }
    var contentType: String? { nil }
    var headers: [String: LosslessStringConvertible] { [:] }
    var timeoutInterval: Double { 60 }
    var cachePolicy: URLRequest.CachePolicy {
        .reloadIgnoringLocalAndRemoteCacheData
    }
}



struct MemesData: Decodable {
    let memes: [Meme]
}

struct Meme: Decodable {
    let url: String?
    let title: String?
    let preview: [String]?
}


