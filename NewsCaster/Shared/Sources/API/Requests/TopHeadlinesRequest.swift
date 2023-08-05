//
//  TopHeadlinesRequest.swift
//  
//
//  Created by Paul Matar on 05/08/2023.
//

import Foundation
import Networking

public enum TopHeadlinesRequest: APIRequest {
    
    case usaTop(Int)
    
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
}
