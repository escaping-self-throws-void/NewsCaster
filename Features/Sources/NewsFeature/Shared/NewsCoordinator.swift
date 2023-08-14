//
//  NewsCoordinator.swift
//  
//
//  Created by Paul Matar on 13/08/2023.
//

import UIKit
import Utilities
import Networking

public final class NewsCoordinator: BaseCoordinator {

    @Injected(.singleton)
    private var router: Routing

    public override func start() {
        DependencyContainer.register(
            type: Networking.self,
            scope: .singleton,
            implementer: Network()
        )
        
        let homeViewController = HomeViewController()
        router.push(homeViewController, isAnimated: true, onNavigateBack: isCompleted)
    }
}
