//
//  Injected.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import Foundation

@propertyWrapper
struct Injected<Dependency> {
    
    private var dependency: Dependency
    
    init(_ dependencyType: DependencyType = .new) {
        guard let dependency = Container.resolve(dependencyType: dependencyType, type: Dependency.self) else {
            fatalError("No dependency of type \(String(describing: Dependency.Type.self)) registered!")
        }
        
        self.dependency = dependency
    }
    
    var wrappedValue: Dependency {
        get { dependency }
        mutating set { dependency = newValue }
    }
    
}
