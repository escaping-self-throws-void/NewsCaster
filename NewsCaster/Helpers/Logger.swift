//
//  Logger.swift
//  NewsCaster
//
//  Created by Paul Matar on 29/07/2023.
//

import OSLog

public extension Logger {
    private static var subsystem: String {
        Bundle.main.bundleIdentifier ?? "Not found"
    }

    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")

    static let statistics = Logger(subsystem: subsystem, category: "statistics")
    
    static let errors = Logger(subsystem: subsystem, category: "errors")
    
}
