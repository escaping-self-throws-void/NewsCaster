//
//  MockRequest.swift
//  
//
//  Created by Paul Matar on 06/08/2023.
//

import Foundation
@testable import API

struct MockRequest: APIRequest {
    var baseURL: URL? {
        URL(string: "MockResponse")
    }
    
    var path: String { "" }
}
