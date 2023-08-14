//
//  TopHeadlinesRequest.swift
//  
//
//  Created by Paul Matar on 05/08/2023.
//

import Foundation
import Networking
import Utilities

public enum TopHeadlinesRequest: NetworkRequest {
    case usaTop(Int)
    
    public var baseURL: URL? {
        URL(string: Environment.baseURL)
    }
    
    public var path: String {
        switch self {
        case .usaTop:
            return "/v2/top-headlines"
        }
    }
    
    public var method: RequestMethod {
        switch self {
        case .usaTop:
            return .GET
        }
    }
    
    public var queryParams: [String : Any]? {
        switch self {
        case .usaTop(let pageSize):
            return ["country": "us", "pageSize": "\(pageSize)"]
        }
    }
    
    public var headers: [String: LosslessStringConvertible] {
        ["X-Api-Key": Environment.apiKey]
    }
}
