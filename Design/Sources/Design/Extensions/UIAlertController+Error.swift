//
//  File.swift
//  
//
//  Created by Paul Matar on 14/08/2023.
//

import UIKit

extension UIAlertController {
    public convenience init(_ error: some LocalizedError, preferredStyle: UIAlertController.Style) {
        let title = error.errorDescription
        let message = [
            error.failureReason,
            error.recoverySuggestion
        ].compactMap { $0 }.joined(separator: "\n\n")
        
        self.init(title: title, message: message, preferredStyle: preferredStyle)
    }
}
