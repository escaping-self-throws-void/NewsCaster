//
//  NetworkingTests.swift
//  
//
//  Created by Paul Matar on 12/08/2023.
//

import XCTest
@testable import Networking

final class NetworkingTests: XCTestCase {
    func testNetworking() async throws {
        let sut: Networking = MockNetworking()
        let request: NetworkRequest = MockRequest()
        let data: MockResponse = try await sut.perform(request)
        let lastArticle = data.articles.last
        
        let unwrappedArticle = try XCTUnwrap(lastArticle)
        let unwrappedAuthor = try XCTUnwrap(unwrappedArticle.author)
        XCTAssertEqual(data.totalResults, 36)
        XCTAssertEqual(unwrappedAuthor, "Jenna Lemoncelli")
    }
}
