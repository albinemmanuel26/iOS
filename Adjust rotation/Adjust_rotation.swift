//
//  Adjust_rotation.swift
//
//  Created by Albin Emmanuel on 10/2/17.
//  Copyright © 2017 Albin Emmanuel. All rights reserved.
//

import Foundation
import UIKit

struct AdjustRotation {
    
    //Call like - AdjustRotation.lockOrientation(.all)
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    /// OPTIONAL Added method to adjust lock and rotate to the desired orientation
    // Call like - AdjustRotation.lockOrientation(.landscapeRight, andRotateTo: .landscapeRight)
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        
        self.lockOrientation(orientation)
        
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
    
}
