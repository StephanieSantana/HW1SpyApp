//
//  AlphanumericCeaserCipher.swift
//  SpyApp
//
//  Created by Stephanie Santana on 9/20/18.
//  Copyright © 2018 Stephanie Santana. All rights reserved.
//

import Foundation

struct AlphanumericCeaserCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        
        for character in plaintext.uppercased() {
            let unicode = character.unicodeScalars.first!.value
            if unicode < 48 || (unicode > 57 && unicode < 65) || unicode > 90 {
                return "Please enter alphanumeric inputs (0-9 & A-Z)"
            }
            var shiftedUnicode = unicode + shiftBy
            while shiftedUnicode > 90 {
                shiftedUnicode = shiftedUnicode - 43
            }
            if (shiftedUnicode > 57 && shiftedUnicode < 65) {
                shiftedUnicode = shiftedUnicode + 7
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ decrypted: String, decryptSecret: String) -> String? {
        var decoded = ""
        guard let shiftBy = UInt32(decryptSecret) else {
            return nil
        }
        
        for character in decrypted.uppercased() {
            let unicode = character.unicodeScalars.first!.value
            if unicode < 48 || (unicode > 57 && unicode < 65) || unicode > 90 {
                return "Please enter alphanumeric inputs (0-9 & A-Z)"
            }
            var shiftedUnicode = unicode
            while shiftedUnicode < 48 {
                shiftedUnicode = shiftedUnicode + 43
            }
            if (shiftedUnicode > 57 && shiftedUnicode < 65) {
                shiftedUnicode = shiftedUnicode - 7
            }
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded.lowercased()
    }
    
}

