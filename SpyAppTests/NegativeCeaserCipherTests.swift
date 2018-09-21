//
//  NegativeCeaserCipherTests.swift
//  SpyAppTests
//
//  Created by Stephanie Santana on 9/20/18.
//  Copyright © 2018 Stephanie Santana. All rights reserved.
//

import XCTest
@testable import SpyApp

class NegativeCeaserCipherTests: XCTestCase {
    
    var cipher: Cipher!
    
    override func setUp() {
        super.setUp()
        cipher = NegativeCeaserCipher()
    }
    
    func test_OneCharacterStringGetsMappedToSelfWith_0_secret()
    {
        let plaintext = "a"
        
        let result = cipher.encode(plaintext, secret: "0")
        
        XCTAssertEqual(plaintext, result)
    }
    func test_nonNumericInputForSecret() {
        let result = cipher.encode("b", secret: "nonNumericString")
        
        XCTAssertNil(result)
    }
}
