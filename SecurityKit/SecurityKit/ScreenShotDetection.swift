//
//  ScreenShotDetection.swift
//  SecurityKit
//
//  Created by Mehran on 4/10/1401 AP.
//

import UIKit

internal class ScreenShotDetection {
    
    typealias action = (Bool) -> (Void)
    
    internal static func whenScreenShot(action: @escaping action)  {
        NotificationCenter.default.addObserver(
            forName: UIApplication.userDidTakeScreenshotNotification,
            object: nil,
            queue: .main) { notification in
                action(true)
            }
    }
}
