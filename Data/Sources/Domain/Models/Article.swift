//
//  File.swift
//  
//
//  Created by Paul Matar on 12/08/2023.
//

import Foundation

public struct Article: Decodable {
    public let author: String?
    public let title: String
    public let description: String?
    public let url: URL?
    public let urlToImage: URL?
    public let publishedAt: Date?
    public let content: String?
}
