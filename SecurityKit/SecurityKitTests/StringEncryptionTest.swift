//
//  StringEncryptionTest.swift
//  SecurityKitTests
//
//  Created by Mehran on 6/18/1401 AP.
//

import XCTest
@testable import SecurityKit

class StringEncryptionTest: XCTestCase {

    var sut : XOREncryptionProtocol!
    
    override func setUp() {
        sut = TestableStringEncryption()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testBytesByXOREncryption_WhenCelled_ShouldReturnValidByteArray() {
        let plain = "PlainText"
        let key = "key"
        let result = sut.encryption(plainText: plain, encryptionKey: key)
        XCTAssertTrue(result as Any is [UInt8])
        XCTAssertEqual(result.count, "PlainText".count)
    }
    
    func testBytesByXORDecryption_WhenCelled_ShouldReturnValidString() {
        let cypher : [UInt8] = [59, 9, 24, 2, 11, 45, 14, 29, 13]
        let key = "key"
        let result = sut.decryption(cypherText: cypher, decryptionKey: key)
        XCTAssertTrue(result as Any is String)
        XCTAssertEqual(result, "PlainText")
    }
}
