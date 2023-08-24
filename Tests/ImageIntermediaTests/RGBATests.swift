//
//  RGBATests.swift
//
//
//  Created by Fang Ling on 2023/8/23.
//

import XCTest
@testable import ImageIntermedia

final class RGBATests : XCTestCase {
    func test_8to10() {
        XCTAssertEqual(rgba_8to10([0, 1, 255]), [0, 4, 1023])
        /* lossless conversion */
        XCTAssertEqual(
          rgba_10to8(rgba_8to10(Array(0 ... 255))),
          Array(0 ... 255)
        )
    }

    func test_8to12() {
        XCTAssertEqual(rgba_8to12([0, 1, 255]), [0, 16, 4095])
        /* lossless conversion */
        XCTAssertEqual(
          rgba_12to8(rgba_8to12(Array(0 ... 255))),
          Array(0 ... 255)
        )
    }

    func test_8to16() {
        XCTAssertEqual(rgba_8to16([0, 1, 255]), [0, 257, 65535])
        /* lossless conversion */
        XCTAssertEqual(
          rgba_16to8(rgba_8to16(Array(0 ... 255))),
          Array(0 ... 255)
        )
    }

    func test_10to12() {
        XCTAssertEqual(rgba_10to12([0, 1, 1023]), [0, 4, 4095])
        /* lossless conversion */
        XCTAssertEqual(
          rgba_12to10(rgba_10to12(Array(0 ... 1023))),
          Array(0 ... 1023)
        )
    }

    func test_10to16() {
        XCTAssertEqual(rgba_10to16([0, 1, 1023]), [0, 64, 65535])
        /* lossless conversion */
        XCTAssertEqual(
          rgba_16to10(rgba_10to16(Array(0 ... 1023))),
          Array(0 ... 1023)
        )
    }

    func test_12to16() {
        XCTAssertEqual(rgba_12to16([0, 1, 4095]), [0, 16, 65535])
        /* lossless conversion */
        XCTAssertEqual(
          rgba_16to12(rgba_12to16(Array(0 ... 4095))),
          Array(0 ... 4095)
        )
    }
}
