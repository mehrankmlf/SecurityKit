//
//  SimulatorDetection.swift
//  SecurityKit
//
//  Created by Mehran on 4/5/1401 AP.
//

import Foundation

internal class Platform {
    
    internal static func isSimulator() -> Bool {
        return runTime() || compileTime()
    }
    
    private static func runTime() -> Bool {
        return ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] != nil
    }
    
    private static func compileTime() -> Bool {
        #if targetEnvironment(simulator)
        // We're on the simulator
        return true
        #else
        // We're on a device
        return false
        #endif
    }
}
