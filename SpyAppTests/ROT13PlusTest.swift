//
//  ROT13PlusTest.swift
//  SpyAppTests
//
//  Created by Stephanie Santana on 9/20/18.
//  Copyright © 2018 Stephanie Santana. All rights reserved.
//

import XCTest
@testable import SpyApp

class ROT13PlusTest: XCTestCase {

    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = ROT13Plus()
    }

    func test_OneCharacterStringGetsMappedToSelfWith_0_secret()
    {
        let plaintext = "n"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("a", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
}
