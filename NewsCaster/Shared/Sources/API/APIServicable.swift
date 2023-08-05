//
//  APIServicable.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public protocol APIServicable {
    func perform<T: Decodable>(request: some APIRequest) async throws -> T
}
