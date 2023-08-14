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
        @Injected var sut: UIControl
        
        XCTAssertNotNil(sut)
        XCTAssertFalse(sut is UISlider)
        XCTAssertTrue(sut is UIButton)
    }
}
