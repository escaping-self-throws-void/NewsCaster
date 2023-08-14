//
//  TopHeadlinesRequest.swift
//  
//
//  Created by Paul Matar on 05/08/2023.
//

import Foundation
import Networking

public enum TopHeadlinesRequest: NetworkRequest {
    case usaTop(Int)
    
    public var baseURL: URL? {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        return URL(string: "https://\(baseURL)")
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
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
        return ["X-Api-Key": apiKey]
    }
}
