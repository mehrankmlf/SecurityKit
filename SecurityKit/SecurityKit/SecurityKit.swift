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
     let reverseEngineering = SecurityKit.isRevereseEngineeringToolsExecuted()
     ```
     */
    public static func isRevereseEngineeringToolsExecuted() -> Bool {
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
     Detect when device get screenshot
     
     - returns: Bool
     - warning: none
     
     # Example #
     ```
     //
     SecurityKit.screenShotDetected { [weak self] data in {
        
     }
     ```
     */
    public static func screenShotDetected(completion : @escaping (Bool?) -> (Void)) {
        ScreenShotDetection.whenScreenShot { value in
            if value {
                completion(true)
            }
        }
    }
    
    
    /**
     Detect when device start screen recording
     
     - returns: Bool
     - warning: none

     # Example #
     ```
     //
     let screenRecording = SecurityKit.screenRecordingDetected()
     ```
     */
    public static func screenRecordingDetected() -> Bool {
        return ScreenRecordingDetection.isScreenRecording()
    }
}
