//
//  NegativeCeaserCipher.swift
//  SpyApp
//
//  Created by Stephanie Santana on 9/20/18.
//  Copyright © 2018 Stephanie Santana. All rights reserved.
//

import Foundation

struct NegativeCeaserCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    //implement this new method
    func decrypt(_ encryptedtext: String, decryptSecret: String) -> String? {
        guard let shiftBy = UInt32(decryptSecret) else {
            return nil
        }
        var decrypted = ""
        
        for character in encryptedtext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        return decrypted
    }
}

