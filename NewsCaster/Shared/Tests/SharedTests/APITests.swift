import XCTest
@testable import API

final class APITests: XCTestCase {
    func testAPIService() async throws {
        let api: APIServicable = MockAPIService()
        let request: APIRequest = MockRequest()
        let data: ArticleRemote.ArticleResponse = try await api.perform(request: request)
        let lastArticle = data.articles.last
        
        let unwrappedArticle = try XCTUnwrap(lastArticle)
        let unwrappedAuthor = try XCTUnwrap(unwrappedArticle.author)
        XCTAssertEqual(data.totalResults, 36)
        XCTAssertEqual(unwrappedAuthor, "Jenna Lemoncelli")
    }
}
