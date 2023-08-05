//
//  HeadlinesRequest.swift
//  
//
//  Created by Paul Matar on 05/08/2023.
//

import Foundation
import Networking

public enum HeadlinesRequest: APIRequest {
    
    case topHeadlinesUS
    
    public var path: String {
        switch self {
        case .topHeadlinesUS:
            return "/v2/top-headlines"
        }
    }
    
    public var method: RequestMethod {
        .GET
    }
    
    public var queryParams: [String : Any]? {
        ["country": "us"]
    }
}
