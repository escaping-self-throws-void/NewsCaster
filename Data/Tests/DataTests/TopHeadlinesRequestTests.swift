import XCTest
@testable import Domain

final class TopHeadlinesRequestTests: XCTestCase {
    
    func testTopHeadlinesRequest() throws {
        let pageSize = 1
        let sut = TopHeadlinesRequest.usaTop(pageSize)
        let queryPageSize = try XCTUnwrap(sut.queryParams?["pageSize"] as? String)
        let method = sut.method.rawValue
        
        XCTAssertTrue(sut.path.contains("headlines"))
        XCTAssertEqual(queryPageSize, String(pageSize))
        XCTAssertEqual(method, "GET")
    }
}
