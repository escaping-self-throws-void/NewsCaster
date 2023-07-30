//
//  NetworkError.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidServerResponseWithStatusCode(statusCode: Int)
    case invalidServerResponse
    case missingBodyData
    case failedToDecodeImage
    case decodingError
    case connectionError(Error)
    case underlying(Error)
}

public extension NetworkError {
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL address"
        case .invalidServerResponse:
            return "Failed to parse the response to HTTPResponse"
        case .connectionError(let error):
            return "Network connection seems to be offline: \(error.localizedDescription)"
        case .decodingError:
            return "Decoding problem"
        case .underlying(let error):
            return error.localizedDescription
        case .invalidServerResponseWithStatusCode(let statusCode):
            return "The server response didn't fall in the given range Status Code is: \(statusCode)"
        case .missingBodyData:
            return "No body data provided from the server"
        case .failedToDecodeImage:
            return "the body doesn't contain a valid data."
        }
    }
}
