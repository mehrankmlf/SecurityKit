//
//  ViewController.swift
//  Example
//
//  Created by Mehran on 4/24/1401 AP.
//

import UIKit
import SecurityKit

class ViewController: BaseViewController {
    
    let sampleKey = "abcdefgh"
    
    @IBOutlet weak var lblJailBroken: UILabel!
    @IBOutlet weak var lblReverseEngineering: UILabel!
    @IBOutlet weak var lblDeviceisSimulator: UILabel!
    @IBOutlet weak var lblVPNActivate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkJailBrokenDevice()
        self.checkReverseEngineering()
        self.checkSimulator()
        self.checkVPNActivate()
        
        ScreenCaptureProtection.shared.makeProtection(for: self.view)
        
        self.makaStringObfuscate()
    }
    
    private func checkJailBrokenDevice() {
        if SecurityKit.isDeviceJailBroken() {
            lblJailBroken.text = "YES"
        }else{
            lblJailBroken.text = "NO"
        }
    }
    
    private func checkReverseEngineering() {
        if SecurityKit.isRevereseEngineeringToolsExecuted() {
            lblReverseEngineering.text = "YES"
        }else{
            lblReverseEngineering.text = "NO"
        }
    }
    
    private func checkSimulator() {
        if SecurityKit.isDeviceSimulator() {
            lblDeviceisSimulator.text = "YES"
        }else{
            lblDeviceisSimulator.text = "NO"
        }
    }
    
    private func checkVPNActivate() {
        if SecurityKit.isVPNConnected() {
            lblVPNActivate.text = "YES"
        }else{
            lblVPNActivate.text = "NO"
        }
    }

    private func makaStringObfuscate() {
        let plainText = "PlainText"
        let key = "key"
        
        let encrypt = SecurityKit.StringEncryption(plainText: plainText, encryptionKey: key)
        
        print(encrypt)
        
        let decrypt = SecurityKit.StringDecryption(cypherText: encrypt, decryptionKey: key)
        
        print(decrypt)
    }
}

