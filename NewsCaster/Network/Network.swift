//
//  Network.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

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
        
        let result = NetworkResponse(response: response, data: data)
#if DEBUG
        log(response: result)
#endif
        return result
    }
}

// MARK: - Private methods
extension Network {
    private func buildURLRequest(from request: NetworkRequest) throws -> URLRequest {
        guard var components = URLComponents(url: request.baseURL, resolvingAgainstBaseURL: true) else {
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
        
        if let httpBody = request.body.httpBody {
            urlRequest.httpBody = httpBody
            urlRequest.setValue("\(httpBody.count)", forHTTPHeaderField: "Content-Length")
        }
        
        for (key, value) in request.headers {
            urlRequest.addValue(value.description, forHTTPHeaderField: key)
        }
#if DEBUG
        log(request: urlRequest)
#endif
        return urlRequest
    }
    
    private func log(request: URLRequest) {
        print("\n--------------- OUTGOING ---------------\n")
        defer { print("\n--------------- END ---------------\n") }
        
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        let body = request.httpBody?.prettyPrintedJSONString
        
        var debugString =
    """
      \(urlAsString) \n\n
      \(method) \(path)?\(query)
      HOST: \(host)\n
    """
        request.allHTTPHeaderFields?.forEach {
            debugString += "\($0): \($1) \n"
        }
        
        if let body {
            debugString += "BODY: \(body) \n"
        }
        print(debugString)
    }
    
    private func log(response: NetworkResponse) {
        print("\n - - - - - - - - - - INCOMMING - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        
        let urlString = response.response.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        var output = ""
        
        if let urlString = urlString {
            output += "\(urlString)"
            output += "\n\n"
        }
        
        output += "HTTP \(response.response.statusCode) \(path)?\(query)\n"
        
        if let host = components?.host {
            output += "Host: \(host)\n"
        }
        for (key, value) in response.response.allHeaderFields {
            output += "\(key): \(value)\n"
        }
        if let body = response.data {
            output += "\n\(body.prettyPrintedJSONString ?? "Unable to pretty print")\n"
        }
        
        print(output)
    }
}
