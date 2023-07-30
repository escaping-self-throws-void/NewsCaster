//
//  NetworkRequest.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public protocol NetworkRequest {
    var baseURL: URL { get }
    var path: String { get }
    var method: RequestMethod { get }
    var queryParams: [String: Any]? { get }
    var body: RequestBody { get }
    var contentType: String? { get }
    var headers: [String: LosslessStringConvertible] { get }
    var timeoutInterval: Double { get }
    var cachePolicy: URLRequest.CachePolicy { get }
}

