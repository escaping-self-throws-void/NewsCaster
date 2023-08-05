import XCTest
@testable import API

final class APITests: XCTestCase {
    func testMockAPIService() async throws {
        let api = MockAPIService()
        let request = MockRequest()
        let data: ArticlesWrapper = try await api.perform(request: request)
        let lastArticle = data.articles.last
        
        let unwrappedArticle = try XCTUnwrap(lastArticle)
        let unwrappedAuthor = try XCTUnwrap(unwrappedArticle.author)
        XCTAssertEqual(data.totalResults, 36)
        XCTAssertEqual(unwrappedAuthor, "Jenna Lemoncelli")
    }
}
