//
//  SecurityKit.swift
//  SecurityKit
//
//  Created by Mehran on 4/10/1401 AP.
//

import Foundation
import UIKit

public class SecurityKit {
    
    /**
     Detect when device is JAILBROKEN
     
     - returns: Bool
     - warning: none
     
     # Example #
     ```
     let jailBroken = SecurityKit.isDeviceJailBroken()
     ```
     */
    public static func isDeviceJailBroken() -> Bool {
        return JailBreakDetection.isJailBroken()
    }
    
    
    /**
     Detect when device is SIMULATOR
     
     - returns: Bool
     - warning: none
     
     # Example #
     ```
     //
     let deviceSimulator = SecurityKit.isDeviceSimulator()
     ```
     */
    public static func isDeviceSimulator() -> Bool {
        return Platform.isSimulator()
    }
    
    
    /**
     Detect when REVERSE ENGINEERING tools have executed like : Frida, Cynject
     
     - returns: Bool
     - warning: none
     
     # Example #
     ```
     //
     let reverseEngineering = SecurityKit.isReverseEngineeringToolsExecuted()
     ```
     */
    public static func isReverseEngineeringToolsExecuted() -> Bool {
        return ReverseEngineering.isReverseEngineeringTools()
    }
    
    
    /**
     Detect when VPN is Connected in device
     
     - returns: Bool
     - warning: none
     
     # Example #
     ```
     //
     let vpnConnected = SecurityKit.isVPNConnected()
     ```
     */
    public static func isVPNConnected() -> Bool {
        return VPNChecker.isVPNConnected()
    }
    
    
    /**
     Before your app enters the background you can go and adjust the this UI to simply not show the user’s sensitive data
     by addSubview UIImage layer
     
     - parameter UIWindow?
     - parameter UIImage?
     - warning: none
     
     # Notes: #
     Use this methods for detect when app goes to background
     1. applicationWillResignActive(_:) method in the AppDelegate
     2. sceneWillResignActive(_ scene:) method in SceneDelegate
     
     # Example #
     ```
     //
     SecurityKit.createSecureScreenShot(window : window, image : image)
     ```
     */
    public static func createSecureScreenShot(window : UIWindow?, image : UIImage) {
        SecureLayer.showImage(window: window, with: image)
    }
    
    
    /**
     Before your app become active you can remove added overlay from UIWindow
     
     - parameter UIWindow
     - warning: none
     
     # Notes: #
     Use this methods for detect when app goes to foreground
     1. applicationWillEnterForeground(_:) method in the AppDelegate
     2. sceneDidBecomeActive(_ scene:) method in SceneDelegate
     
     # Example #
     ```
     //
     SecurityKit.removeSecureScreenShot(window:inout window)
     ```
     */
    public static func removeSecureScreenShot(window:inout UIWindow?) {
        SecureLayer.removeOverlayImage(&window)
    }
    
    /**
     Hide Sensitive String data from run time binary
     
     - parameter String
     - parameter String
     - returns   [UInt8]
     - warning: none
     
     # Notes: #
     Use this method use for encrypt string
     base on XOR alghorithm
     # Example #
     ```
     //
     SecurityKit.stringEncryption(plainText : "String", encryptionKey: "String")
     ```
     */
    public static func stringEncryption(plainText : String, encryptionKey: String) -> [UInt8] {
        return XOREncryption.encryption(plainText: plainText, encryptionKey: encryptionKey)
    }
    
    /**
     Hide Sensitive String data from run time binary
     
     - parameter String
     - parameter String
     - returns   String
     - warning: none
     
     # Notes: #
     Use this method use for array of [UInt8]
     # Example #
     ```
     //
     SecurityKit.stringDecryption(cypherText: [UInt8]?, decryptionKey : "String")
     ```
     */
    public static func stringDecryption(cypherText: [UInt8]?, decryptionKey : String?) -> String {
        return XOREncryption.decryption(cypherText: cypherText, decryptionKey: decryptionKey)
    }
}
