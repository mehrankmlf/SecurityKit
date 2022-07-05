//
//  VPNChecker.swift
//  SecurityKit
//
//  Created by Mehran on 4/5/1401 AP.
//

import Foundation

internal class VPNChecker {
    
    internal static func isVPNConnected() -> Bool {
        return vpnStatus()
    }
     // Check vpn status 
   private static func vpnStatus() -> Bool {
        let cfDict = CFNetworkCopySystemProxySettings()
        let nsDict = cfDict!.takeRetainedValue() as NSDictionary
        let keys = nsDict["__SCOPED__"] as! NSDictionary

        for key: String in keys.allKeys as! [String] {
            if (key == "tap" || key == "tun" || key == "ppp" || key == "ipsec" || key == "ipsec0" || key == "utun1" || key == "utun2") {
                return true
            }
        }
        return false
    }
}

