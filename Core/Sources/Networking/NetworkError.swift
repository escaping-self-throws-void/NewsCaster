//
//  NetworkError.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidServerResponseWithStatusCode(Int)
    case invalidServerResponse
}

public extension NetworkError {
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL address"
        case .invalidServerResponse:
            return "Failed to parse the response to HTTPResponse"
        case .invalidServerResponseWithStatusCode(let statusCode):
            return "The server response didn't fall in the given range Status Code is: \(statusCode)"
        }
    }
}
