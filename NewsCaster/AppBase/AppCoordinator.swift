//
//  AppCoordinator.swift
//  NewsCaster
//
//  Created by Paul Matar on 13/08/2023.
//

import UIKit
import Utilities
import NewsFeature

final class AppCoordinator: BaseCoordinator {
     
    private let window: UIWindow
        
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let navigationController = UINavigationController()
        
        DependencyContainer.register(
            type: Routing.self,
            scope: .singleton,
            implementer: Router(navigationController: navigationController)
        )

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
                
        let newsCoordinator = NewsCoordinator()
        start(coordinator: newsCoordinator)
    }
}
