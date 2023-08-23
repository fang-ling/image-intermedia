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
        XCTAssertEqual(
          rgba_8to10(Array<UInt8>(0 ... 255)),
          Array<UInt16>(stride(from: 1, through: 1024, by: 4))
        )
    }
}
