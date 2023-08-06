import XCTest
@testable import Utilities

final class ISO8601DateParserTests: XCTestCase {
    
    func testDateParser() throws {
        let rawDate = "2023-08-04T14:25:00Z"
        let format = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let parsedDate = ISO8601DateParser.parse(rawDate)
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let formattedDate = formatter.date(from: rawDate)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(parsedDate, formattedDate)
    }
    
    func testParserPerfomance() throws {
        let rawDate = "2023-08-04T14:25:00Z"
        let array = Array(repeating: rawDate, count: 100_000)
        
        measure {
            array.forEach { rawDate in
                _ = ISO8601DateParser.parse(rawDate)
            }
        }
    }
    
    func testDefaultDateFormatterPerfomance() throws {
        let rawDate = "2023-08-04T14:25:00Z"
        let format = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let form = DateFormatter()
        form.dateFormat = format
        let array = Array(repeating: rawDate, count: 100_000)
        
        measure {
            array.forEach { rawDate in
                _ = form.date(from: rawDate)
            }
        }
    }
}
