//
//  Container.swift
//  NewsCaster
//
//  Created by Paul Matar on 08/06/2023.
//

import Foundation

final class Container {
    private static var cache: [String: Any] = [:]
    private static var generators: [String: () -> Any] = [:]
    
    static func register<Dependency>(
        dependencyType: DependencyType = .automatic,
        _ generator: @autoclosure @escaping () -> Dependency
    ) {
        let key = String(describing: Dependency.self)
        generators[key] = generator
        
        if dependencyType == .singleton {
            cache[key] = generator()
        }
    }
    
    static func resolve<Dependency>(dependencyType: DependencyType = .automatic) -> Dependency? {
        let key = String(describing: Dependency.self)
        
        switch dependencyType {
        case .singleton:
            if let cachedDependency = cache[key] as? Dependency {
                return cachedDependency
            } else {
                fatalError("\(String(describing: Dependency.self)) is not registered as singleton")
            }
            
        case .automatic:
            if let cachedDependency = cache[key] as? Dependency {
                return cachedDependency
            }
            fallthrough
            
        case .new:
            if let dependency = generators[key]?() as? Dependency {
                cache[String(describing: Dependency.self)] = dependency
                return dependency
            } else {
                return nil
            }
        }
    }
}
