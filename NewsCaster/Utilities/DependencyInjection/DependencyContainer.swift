//
//  DependencyContainer.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import Foundation

final class DependencyContainer {
    private static var cache: [String: Any] = [:]
    private static var generators: [String: () -> Any] = [:]
    
    static func register<Dependency>(
        type: Dependency.Type,
        dependencyType: DependencyType = .automatic,
        implementer generator: @autoclosure @escaping () -> Dependency
    ) {
        let key = String(describing: type.self)
        generators[key] = generator
        
        if dependencyType == .singleton {
            cache[key] = generator()
        }
    }
    
    static func resolve<Dependency>(
        dependencyType: DependencyType = .automatic,
        type: Dependency.Type
    ) -> Dependency? {
        let key = String(describing: type.self)
        
        switch dependencyType {
        case .singleton:
            if let cachedDependency = cache[key] as? Dependency {
                return cachedDependency
            } else {
                fatalError("\(key) is not registered as singleton")
            }
            
        case .automatic:
            if let cachedDependency = cache[key] as? Dependency {
                return cachedDependency
            }
            fallthrough
            
        case .new:
            if let dependency = generators[key]?() as? Dependency {
                cache[key] = dependency
                return dependency
            } else {
                return nil
            }
        }
    }
}
