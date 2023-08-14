import XCTest
@testable import Utilities

final class ISO8601DateParserTests: XCTestCase {
    
    func testDateParser() throws {
        let rawDate = "2023-08-04T14:25:00Z"
        let format = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let sut = ISO8601DateParser.parse(rawDate)
        let formattedDate = formatter.date(from: rawDate)
        XCTAssertEqual(sut, formattedDate)
    }
    
    func testParserPerfomance() throws {
        let rawDate = "2023-08-04T14:25:00Z"
        let sut = Array(repeating: rawDate, count: 100_000)
        
        measure {
            sut.forEach { rawDate in
                _ = ISO8601DateParser.parse(rawDate)
            }
        }
    }
    
    func testDefaultDateFormatterPerfomance() throws {
        let rawDate = "2023-08-04T14:25:00Z"
        let format = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let form = DateFormatter()
        form.dateFormat = format
        
        let sut = Array(repeating: rawDate, count: 100_000)
        
        measure {
            sut.forEach { rawDate in
                _ = form.date(from: rawDate)
            }
        }
    }
}
