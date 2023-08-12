//
//  APIRequest.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation
import Networking

public extension NetworkRequest {
    var baseURL: URL? {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? ""
        return URL(string: "https://\(baseURL)")
    }
    
    var headers: [String: LosslessStringConvertible] {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
        return ["X-Api-Key": apiKey]
    }
}
