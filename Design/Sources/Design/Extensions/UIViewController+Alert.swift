//
//  File.swift
//  
//
//  Created by Paul Matar on 14/08/2023.
//

import UIKit

extension UIViewController {
    public func show(error: LocalizedError) {
        let alertController = UIAlertController(error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    public func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
