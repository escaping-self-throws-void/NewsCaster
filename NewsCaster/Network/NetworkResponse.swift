//
//  NetworkResponse.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public struct NetworkResponse {
    let response: HTTPURLResponse
    let data: Data?
    
    public init(response: HTTPURLResponse, data: Data?) {
        self.response = response
        self.data = data
    }
}
