//
//  Networking.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public protocol Networking {
    func send(_ request: NetworkRequest) async throws -> NetworkResponse
}

