//
//  JailBrokenDetection.swift
//  SecurityKit
//
//  Created by Mehran on 4/3/1401 AP.
//

import Foundation
import UIKit

internal class JailBreakDetection {
    
    internal static func isJailBroken() -> Bool {
        let isCydiaInstalled = hasCydiaInstalled()
        let fileCheck = isPathsExist()
        let directories = isDirectoriesWriteable()
        let filesCanOpen = isSuspiciousFilesCanBeOpened()
        let directorieWriteable = isRestrictedDirectoriesWriteable()
        
        return isCydiaInstalled ||
        fileCheck ||
        directories ||
        filesCanOpen ||
        directorieWriteable
    }
    
    //check if cydia is installed (using URI Scheme)
    static func hasCydiaInstalled() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "cydia://")!)
    }
    
    //suspicious system and app paths to check
    private static var suspicousAppandSystemPaths: [String] {
        return [
            "/usr/sbin/frida-server",
            "/etc/apt/sources.list.d/electra.list",
            "/etc/apt/sources.list.d/sileo.sources",
            "/.bootstrapped_electra",
            "/usr/lib/libjailbreak.dylib",
            "/jb/lzma",
            "/.cydia_no_stash",
            "/.installed_unc0ver",
            "/jb/offsets.plist",
            "/usr/share/jailbreak/injectme.plist",
            "/etc/apt/undecimus/undecimus.list",
            "/var/lib/dpkg/info/mobilesubstrate.md5sums",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/jb/jailbreakd.plist",
            "/jb/amfid_payload.dylib",
            "/jb/libjailbreak.dylib",
            "/usr/libexec/cydia/firmware.sh",
            "/var/lib/cydia",
            "/etc/apt",
            "/private/var/lib/apt",
            "/private/var/Users/",
            "/var/log/apt",
            "/Applications/Cydia.app",
            "/private/var/stash",
            "/private/var/lib/apt/",
            "/private/var/lib/cydia",
            "/private/var/cache/apt/",
            "/private/var/log/syslog",
            "/private/var/tmp/cydia.log",
            "/Applications/Icy.app",
            "/Applications/MxTube.app",
            "/Applications/RockApp.app",
            "/Applications/blackra1n.app",
            "/Applications/SBSettings.app",
            "/Applications/FakeCarrier.app",
            "/Applications/WinterBoard.app",
            "/Applications/IntelliScreen.app",
            "/private/var/mobile/Library/SBSettings/Themes",
            "/Library/MobileSubstrate/CydiaSubstrate.dylib",
            "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
            "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
            "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
            "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"
        ]
    }
    
    private static func isPathsExist() -> Bool {
        for path in suspicousAppandSystemPaths {
            if FileManager.default.fileExists(atPath: path){
                return true
            }
        }
        return false
    }
    
    private static var directories: [String] {
        return [
            "/",
            "/root/",
            "/private/",
            "/jb/"
        ]
    }
    
    private static func isDirectoriesWriteable() -> Bool {
        // Checks if the restricted directories are writeable.
        for path in directories {
            do{
                let filePath = path + UUID().uuidString
                try "i escaped the Jail".write(toFile: filePath, atomically: true, encoding: .utf8)
                try FileManager.default.removeItem(atPath: filePath)
                return true
            }catch let error{print(error.localizedDescription)}
        }
        return false
    }
    
    private static var suspiciousFiles : [String] {
        return [
            "/.installed_unc0ver",
            "/.bootstrapped_electra",
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/etc/apt",
            "/var/log/apt"
        ]
    }
    
    private static func isSuspiciousFilesCanBeOpened() -> Bool {
        for path in suspiciousFiles {
            
            if FileManager.default.isReadableFile(atPath: path) {
                return false
            }
        }
        return true
    }
    
    
    private static var restrictedDirectories : [String] {
        return [
            "/",
            "/root/",
            "/private/",
            "/jb/"
        ]
    }
    
    static func isRestrictedDirectoriesWriteable() -> Bool {
        
        for path in restrictedDirectories {
            do {
                let pathWithSomeRandom = path+UUID().uuidString
                try "AmIJailbroken?".write(toFile: pathWithSomeRandom, atomically: true, encoding: String.Encoding.utf8)
                try FileManager.default.removeItem(atPath: pathWithSomeRandom) // clean if succesfully written
                return false
            } catch {}
        }
        
        return true
    }
}
