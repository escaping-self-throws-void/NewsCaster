//
//  APIRequest.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation
import Networking

public protocol APIRequest: NetworkRequest {}

// Default values
public extension APIRequest {
    var baseURL: URL? {
        let stringUrl = "https://\(Bundle.main.infoDictionary?["BASE_URL"] ?? "")"
        return URL(string: stringUrl)
    }
    
    var method: RequestMethod {
        .GET
    }
    
    var queryParams: [String: Any]? {
        nil
    }
    
    var body: RequestBody {
        .none
    }
    
    var contentType: String? {
        nil
    }
    
    var headers: [String: LosslessStringConvertible] {
        let apiKey = "\(Bundle.main.infoDictionary?["API_KEY"] ?? "")"
        return ["X-Api-Key": apiKey]
    }
    
    var timeoutInterval: Double {
        60
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        .reloadIgnoringLocalAndRemoteCacheData
    }
}
