//
//  CipherFactory.swift
//  SpyApp
//
//  Created by Stephanie Santana on 9/5/18.
//  Copyright © 2018 Stephanie Santana. All rights reserved.
//

import Foundation

struct CipherFactory {
    
    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "AlphaNum": AlphanumericCeaserCipher(),
        "ROT13+": ROT13Plus(),
        "NegCeaser": NegativeCeaserCipher(),
        
    ]
    
    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}

