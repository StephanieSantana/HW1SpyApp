//
//  SpyAppViewController.swift
//  SpyApp
//
//  Created by Stephanie Santana on 9/5/18.
//  Copyright © 2018 Stephanie Santana. All rights reserved.
//

import UIKit

class SpyAppViewController: UIViewController {
    
   // override func viewDidLoad() {
   // super.viewDidLoad()
   //     self.view.backgroundColor = UIColor.white
    
   // }
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    
    let factory = CipherFactory()
    var cipher: Cipher?
    
    var plaintext: String {
        if let text = input.text {
            return text
        } else {
            return ""
        }
    }
    
    var secretText: String {
        if let text = secret.text {
            return text
        } else {
            return ""
        }
    }
    
    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let encoded = cipher.encode(plaintext, secret: secretText) {
            output.text = encoded
        } else {
            output.text = "Error encoding"
        }
    }
    
    @IBAction func decryptButtonPressed(_ sender: UIButton) {
        guard let cipher = self.cipher else {
            output.text = "No cipher selected"
            return
        }
        if let decrypted =
            cipher.decrypt(plaintext, decryptSecret: secretText){
            output.text = decrypted
        } else {
            output.text = "Error decrypting"
        }
    }
    
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button text"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }
}



