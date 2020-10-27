//
//  AppDelegate.swift
//  TestRotationOverride_Swift
//
//  Created by Amitai Blickstein on 4/25/19.
//  Copyright © 2019 Amitai Blickstein. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // MARK: - Orientation Support ("Backdoor")
    
    var orientationDelegate = RotationController.shared

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationDelegate.isUnlocked ? .allButUpsideDown : .portrait
    }
}
