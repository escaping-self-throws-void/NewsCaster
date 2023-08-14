//
//  File.swift
//  
//
//  Created by Paul Matar on 14/08/2023.
//

import Foundation

public protocol Loader {
    associatedtype T
    func download(from url: URL) async throws -> T
}
