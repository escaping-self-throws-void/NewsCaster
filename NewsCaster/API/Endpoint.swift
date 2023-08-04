//
//  Endpoint.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation
import Networking

public enum Endpoint {
    case search(Int)
    
}

extension Endpoint: APIRequest {
    public var path: String {
        switch self {
        case .search(let num):
            return "/gimme/\(num)"
        }
    }
    
    public var method: RequestMethod {
        switch self {
        case .search:
            return .GET
        }
    }
    
    public var body: RequestBody {
        switch self {
        case .search:
            return .none
        }
    }
}
