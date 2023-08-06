//
//  Network.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation
import Logs

public struct Network {
    private let session: URLSession
    
    public init(session: URLSession = .init(configuration: .default)) {
        self.session = session
    }
}

// MARK: - Networking
extension Network: Networking {
    public func send(_ request: NetworkRequest) async throws -> NetworkResponse {
        let urlRequest = try buildURLRequest(from: request)
        
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse else {
            throw NetworkError.invalidServerResponse
        }
        
#if DEBUG
        Logs<Self>.log(response: response, data: data)
#endif
        
        guard (200..<300) ~= response.statusCode  else {
            throw NetworkError.invalidServerResponseWithStatusCode(response.statusCode)
        }
        
        return NetworkResponse(response: response, data: data)
    }
}

// MARK: - Private methods
extension Network {
    private func buildURLRequest(from request: NetworkRequest) throws -> URLRequest {
        guard let url = request.baseURL else {
            throw NetworkError.invalidURL
        }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            throw NetworkError.invalidURL
        }
        
        components.path = request.path
        
        if let queryParams = request.queryParams {
            components.queryItems = queryParams.map { .init(name: $0.key, value: $0.value as? String) }
        }
        
        guard let requestURL = components.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(
            url: requestURL,
            cachePolicy: request.cachePolicy,
            timeoutInterval: request.timeoutInterval
        )
        
        urlRequest.httpMethod = request.method.rawValue
        
        if let contentType = request.contentType {
            urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        }
        
        if let httpBody = try request.body.toHttpBody() {
            urlRequest.httpBody = httpBody
            urlRequest.setValue("\(httpBody.count)", forHTTPHeaderField: "Content-Length")
        }
        
        for (key, value) in request.headers {
            urlRequest.addValue(value.description, forHTTPHeaderField: key)
        }
#if DEBUG
        Logs<Self>.log(request: urlRequest)
#endif
        return urlRequest
    }
}
