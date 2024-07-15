//
//  06_TestFailure.swift
//  BreakpointMaker
//
//  Created by junely on 7/11/24.
//

import XCTest
@testable import BreakpointMaker

final class SomeTestCase: XCTestCase {
    
    var sut: ViewController!

    override func setUp() {
        super.setUp()
        sut = ViewController()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_decodeHive() {
        // given
        let myHiveSdkString = """
        {
            "brand": "V4",
            "base": [
                "HiveCore", "HiveService", "HiveProtocol"
            ],
            "moreChoice": [
                "HiveIAPV4", "HivePromotion"
            ]
        }
        """
        
        // when
        let decoded = sut.decodeHive(from: myHiveSdkString)
        let expected = Hive(brand: .v4,
                            base: [.core, .service, .protocol],
                            moreChoice: [.iapV4, .promotion, .dataStore])
        
        // then
        XCTAssertEqual(decoded, expected)
    }

}
