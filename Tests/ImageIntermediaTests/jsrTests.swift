import XCTest
@testable import ImageIntermedia

final class jsrTests: XCTestCase {
    func testExample() throws {
        /* Violet with opacity 0.8: rgba(155, 38, 182, 0.8) */
        let violet =
          RGBA64Pixel(
            red: 155,
            green: 38,
            blue: 182,
            alpha: Color(0.8 * 256)
          )
        XCTAssertEqual(violet.red(), 155)
        XCTAssertEqual(violet.green(), 38)
        XCTAssertEqual(violet.blue(), 182)
        XCTAssertEqual(violet.alpha(), 204)
    }
}
