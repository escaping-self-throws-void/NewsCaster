//
//  API.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public struct API: APIServicable {
    @Injected private var network: Networking
    @Injected private var coder: Coder

    public func perform<T: Decodable>(request: APIRequest) async throws -> T {
        let response = try await network.send(request)
        guard let data = response.data else {
            throw NetworkError.missingBodyData
        }
        
        guard let result: T = coder.decode(from: data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }
}
