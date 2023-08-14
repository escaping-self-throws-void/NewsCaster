//
//  File.swift
//  
//
//  Created by Paul Matar on 13/08/2023.
//

import Foundation

public protocol Repository {
    associatedtype T
    
    func get(_ count: Int) async -> T
}
