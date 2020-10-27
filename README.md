# RotationLockDemo
Simple project meant to demonstrate how to lock and unlock landscape mode dynamically.

## Usage
Call the singleton object to lock and unlock the app, such as for a specific view controller:
```
// App locked to portrait, but this VC is to be an exception.
 override func viewDidLoad() {
     super.viewDidLoad()
     RotationController.shared.unlock() 
 }

 override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     RotationController.shared.lock()
 }
```

## Implementation
This works by adding a logical 'backdoor' to the supported interfaces method in the AppDelegate:
```
func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return RotationController.shared.isUnlocked 
        ? .allButUpsideDown : .portrait
}
```

The `RotationController` is merely an implementation of a protocol, `OrientationLockDelegate`:
```
protocol OrientationLockDelegate {
    func lock()
    func unlock()
    var  isUnlocked: Bool { get }
}
```

Questions? Comments? All appreciated
