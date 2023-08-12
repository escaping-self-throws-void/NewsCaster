//
//  MockRequest.swift
//  
//
//  Created by Paul Matar on 06/08/2023.
//

import Foundation
@testable import Networking

struct MockRequest: NetworkRequest {
    var method: RequestMethod {
        .GET
    }
    
    var baseURL: URL? {
        URL(string: "MockJSON")
    }
    
    var path: String { "" }
}
