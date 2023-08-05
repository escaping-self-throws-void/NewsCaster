//
//  Logs.swift
//
//
//  Created by Paul Matar on 04/08/2023.
//

import OSLog

public enum Logs<T> {
    static var logger: Logger {
        let subsystem = Bundle.main.bundleIdentifier ?? "N/A"
        return .init(subsystem: subsystem, category: String(describing: T.self))
    }
    
    static public func log(_ string: String?) {
        logger.debug("\(string ?? "nil")")
    }
    
    static public func log(_ error: Error) {
        logger.error("\(error)")
    }
}
