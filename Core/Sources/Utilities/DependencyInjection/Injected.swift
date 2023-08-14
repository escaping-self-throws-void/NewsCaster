//
//  Injected.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import Foundation

@propertyWrapper
public struct Injected<Dependency> {
    
    private var dependency: Dependency
    
    public init(_ scope: ScopeType = .new) {
        guard let dependency = DependencyContainer.resolve(scope: scope, type: Dependency.self) else {
            fatalError("No dependency of type \(String(describing: Dependency.Type.self)) registered!")
        }
        
        self.dependency = dependency
    }
    
    public var wrappedValue: Dependency {
        get { dependency }
        mutating set { dependency = newValue }
    }
}
