//
//  RotationController.swift
//  TestRotationOverride_Swift
//
//  Created by Amitai Blickstein on 4/25/19.
//  Copyright © 2019 Amitai Blickstein. All rights reserved.
//

import UIKit

protocol OrientationLockDelegate {
    func lock()
    func unlock()
    var  isUnlocked: Bool { get }
//    var  _landscapeAllowed: Bool { get }
}


/// Use this class to inform the AppDelegate about orientation preferences at runtime.
class RotationController: OrientationLockDelegate {
    // Singleton pattern makes sense, as there is only one device screen,
    // that can only be oriented in one way at a time.
    static var shared = RotationController()
    private init() {}
    
    func lock() {
        _landscapeAllowed = false
    }
    
    func unlock() {
        _landscapeAllowed = true
    }
    
    var isUnlocked: Bool
    {
        set { newValue ? unlock() : lock() }
        get { _landscapeAllowed }
    }
    
    /// Simple underlying boolean flag, with logic to set initial value to the Info.plist value. Defaults to false.
    private var _landscapeAllowed: Bool = {
        // With iPadOS, we have a new key to account for on 'iOS' devices.
        var supportedOrientationsKey = UIDevice.current.userInterfaceIdiom.description == "pad" ?
            kUISupportedInterfaceOrientations_ipad : kUISupportedInterfaceOrientations
        
        // Get the default for the current device
        guard let supportedOrientations = Bundle.main.object(forInfoDictionaryKey: supportedOrientationsKey) as? [String]
            else { return false }

        //
        // Either should return "true":
        //        UIInterfaceOrientationLandscapeLeft
        //        UIInterfaceOrientationLandscapeRight
        return supportedOrientations.contains { $0.contains("LandScape") }
    }()
}

extension UIUserInterfaceIdiom: CustomStringConvertible {
    var description: String {
        switch self {
            case .phone: return "phone"
            case .pad:   return "pad"
            default: String(describing: self)
        }
    }
}

// destringify strings
fileprivate let kUISupportedInterfaceOrientations_ipad = "UISupportedInterfaceOrientations~ipad"
fileprivate let kUISupportedInterfaceOrientations      = "UISupportedInterfaceOrientations"
