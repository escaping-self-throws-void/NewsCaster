//
//  DependencyInjectionTests.swift
//  
//
//  Created by Paul Matar on 06/08/2023.
//

import XCTest
@testable import Utilities

final class DependencyInjectionTests: XCTestCase {
    
    
    override class func setUp() {
        DependencyContainer.register(type: UIControl.self, implementer: UIButton())
    }
    
    func testInjection() {
        @Injected var injection: UIControl
        
        XCTAssertNotNil(injection)
        XCTAssertFalse(injection is UISlider)
        XCTAssertTrue(injection is UIButton)
    }
}
