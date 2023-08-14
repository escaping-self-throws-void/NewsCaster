//
//  Routing.swift
//  
//
//  Created by Paul Matar on 13/08/2023.
//

import UIKit

public protocol Routing: AnyObject {
    func push(_ viewController: UIViewController, isAnimated: Bool, onNavigateBack: VoidClosure?)
    func pop(_ isAnimated: Bool)
    func popToRoot(_ isAnimated: Bool)
    func openURL(_ url: URL)
    func showAlert(on viewController: UIViewController, title: String, message: String)
}
