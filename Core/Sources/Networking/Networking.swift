//
//  Networking.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public protocol Networking {
    func perform<T: Decodable>(_ request: some NetworkRequest) async throws -> T
}

