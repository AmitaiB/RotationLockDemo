//
//  ViewController.swift
//  TestRotationOverride_Swift
//
//  Created by Amitai Blickstein on 4/25/19.
//  Copyright © 2019 Amitai Blickstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RotationController.shared.unlock()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        RotationController.shared.lock()
    }
    
    @IBAction func rotationLockToggled(_ sender: UISwitch) {
        RotationController.shared.isUnlocked = sender.isOn
    }
    
    
}
