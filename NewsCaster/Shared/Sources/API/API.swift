//
//  API.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation
import Utilities
import Networking

public struct API: APIServicable {
    @Injected private var network: Networking
    private let decoder: JSONDecoder
    
    public init(decoder: JSONDecoder = .init()) {
        self.decoder = decoder
    }
    
    public func perform<T: Decodable>(request: APIRequest) async throws -> T {
        let response = try await network.send(request)
        
        return try decoder.decode(T.self, from: response.data)
    }
}
