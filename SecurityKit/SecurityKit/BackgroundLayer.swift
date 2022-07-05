//
//  BackgroundLayer.swift
//  SecurityKit
//
//  Created by Mehran on 4/6/1401 AP.
//

import Foundation
import UIKit

internal class SecureLayer {
    
    static func showImage(window : UIWindow?, with image : UIImage?) {
        guard let window = window,let image = image else{return}
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor.white
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFit
        imageView.snapshotView(afterScreenUpdates: true)
        imageView.frame = window.bounds
        window.addSubview(imageView)
    }
    
    static func removeOverlayImage(_ window:inout UIWindow?){
     guard let window = window else{return}
        for view in window.subviews{
            if view is UIImageView{
                view.removeFromSuperview()
            }
        }
    }
}
