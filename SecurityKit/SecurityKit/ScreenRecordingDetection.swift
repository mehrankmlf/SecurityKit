//
//  PreventScreenRecording.swift
//  SecurityKit
//
//  Created by Mehran on 4/10/1401 AP.
//

import UIKit

internal class ScreenRecordingDetection {
    
    internal static func isScreenRecording() -> Bool {
        for screen in UIScreen.screens {
            if screen.isCaptured {
                return true
            } else {
                return false
            }
        }
        return false
    }
}
