//
//  Coder.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import Foundation

public protocol Coder {
    func encode<T>(_ value: T) -> Data?
    func decode<T>(_ data: Data) -> T?
    func decode<D: Decodable>(from data: Data) -> D?
}
