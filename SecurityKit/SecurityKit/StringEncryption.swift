//
//  StringEncryption.swift
//  SecurityKit
//
//  Created by Mehran on 6/15/1401 AP.
//

import Foundation

internal class XOREncryption {
    
    static func encryption(plainText: String?, encryptionKey : String?) -> [UInt8] {
        
        guard let plainText = plainText,
              let encryptionKey = encryptionKey
        else { return [UInt8]() }
        
        var encrypted = [UInt8]()
        let text = [UInt8](plainText.utf8)
        let key = [UInt8](encryptionKey.utf8)
        let length = key.count
        
        // encrypt bytes base on XOR data encryption
        for t in text.enumerated() {
            encrypted.append(t.element ^ key[t.offset % length])
        }
        return encrypted
    }
    
    static func decryption(cypherText: [UInt8]?, decryptionKey : String?) -> String {
        
        guard let cypherText = cypherText,
              let decryptionKey = decryptionKey
        else { return "" }
        
        var decrypted = [UInt8]()
        let cypher = cypherText
        let key = [UInt8](decryptionKey.utf8)
        let length = key.count
        
        /// decrypt bytes base on XOR data encryption
        for c in cypher.enumerated() {
            decrypted.append(c.element ^ key[c.offset % length])
        }
        return String(bytes: decrypted, encoding: .utf8)!
    }
}
