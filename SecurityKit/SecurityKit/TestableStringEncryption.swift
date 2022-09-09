//
//  TestableStringEncryption.swift
//  SecurityKit
//
//  Created by Mehran on 6/18/1401 AP.
//

import Foundation

protocol XOREncryptionProtocol {
    func encryption(plainText: String?, encryptionKey : String?) -> [UInt8]
    func decryption(cypherText: [UInt8]?, decryptionKey : String?) -> String
}
// this class helps to write unit test for encryption process
internal class TestableStringEncryption: XOREncryptionProtocol {
    func encryption(plainText: String?, encryptionKey: String?) -> [UInt8] {
        XOREncryption.encryption(plainText: plainText, encryptionKey: encryptionKey)
    }
    
    func decryption(cypherText: [UInt8]?, decryptionKey: String?) -> String {
        return XOREncryption.decryption(cypherText: cypherText, decryptionKey: decryptionKey)
    }
}
