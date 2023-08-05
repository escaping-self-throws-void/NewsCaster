//
//  MockAPIService.swift
//  
//
//  Created by Paul Matar on 05/08/2023.
//

import Foundation
import API

struct MockAPIService: APIServicable {
    
    enum MockError: LocalizedError {
        case invalidURL
        case fileSource
        
        var errorDescription: String? {
            switch self {
            case .invalidURL:
                return "The provided URL was invalid"
            case .fileSource:
                return "Unable to obtain requested data"
            }
        }
    }
    
    func perform<T>(request: some APIRequest) async throws -> T where T : Decodable {
        guard let url = request.baseURL else {
            throw MockError.invalidURL
        }
        guard let path = file(for: url) else {
            throw MockError.fileSource
        }
        
        let data = try Data(contentsOf: path)
        let decodedObject = try JSONDecoder().decode(T.self, from: data)
        
        return decodedObject
    }
    
    
    private func file(for url: URL) -> URL? {
        Bundle.module.url(forResource: (url.absoluteString as NSString).lastPathComponent, withExtension: "json")
    }
}
