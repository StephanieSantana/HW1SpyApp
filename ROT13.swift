//
//  ROT13.swift
//  SpyApp
//
//  Created by Stephanie Santana on 9/20/18.
//  Copyright © 2018 Stephanie Santana. All rights reserved.
//

import Foundation

struct ROT13: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + 13
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encryptedtext: String, decryptSecret: String) -> String? {
        
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
