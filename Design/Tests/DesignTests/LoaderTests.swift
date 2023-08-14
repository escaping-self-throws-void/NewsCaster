import XCTest
@testable import Design
import Utilities
import Networking

final class DesignTests: XCTestCase {
    
    var imageUrl: URL? {
        URL(string: "https://www.hollywoodreporter.com/wp-content/uploads/2023/08/2023_08-obit-Mark_Margolis-H.jpg?w=1024")
    }
    
    override class func setUp() {
        DependencyContainer.register(type: Networking.self, scope: .singleton, implementer: Network())
    }
    
    func testImageLoader() async throws {
        let unwrapped = try XCTUnwrap(imageUrl)
        let sut = try await MockLoader.shared.download(from: unwrapped)

        XCTAssertNotNil(sut.0)
    }
    
    func testImageCache() async throws {
        let cached = "cached"
        let downloaded = "downloaded"
        let unwrapped = try XCTUnwrap(imageUrl)
        let sut = try await MockLoader.shared.download(from: unwrapped)
        XCTAssertEqual(sut.1, downloaded)
        XCTAssertNotEqual(sut.1, cached)
        
        let sutCache = try await MockLoader.shared.download(from: unwrapped)
        XCTAssertEqual(sutCache.1, cached)
        XCTAssertNotEqual(sutCache.1, downloaded)
    }
}
