<p align="center">
	<img src="https://raw.githubusercontent.com/mehrankmlf/SecurityKit/master/Resource/TopImage.png" alt="SecurityKit" width="256" height="256">
</p>

## Security Kit

<p align="center">
	<b>
	Security Kit is a lightweight framework that helps to achieve a security layer
	</b>
</p>

<p align="center">
  • <a href="#usage">Example</a>
  • <a href="#usage">Usage</a>
  • <a href="#installation">Installation</a>
  • <a href="#license">License</a>
</p>
		            
## Example

To run the example project, run `pod try SecurityKit`

## Features

- [x] JailBroken Device Detection
- [x] Security Background Layer
- [x] Detect Reverse Engineering Tools Executed.
- [x] Check Device is a Simulator or a Real Device.
- [x] Check VPN is running.
- [x] Screen Capture Protection.
- [x] Obfuscate Sensitive String with XOR Data Encryption Algorithm.

### Requirements

| Language  | Branch | Pod version | Xcode version | iOS version |
| --------- | ------ | ----------- | ------------- | ----------- |
| Swift 5.0 | [master](https://github.com/mehrankmlf/SecurityKit/tree/master) | >= 1.0.x | Xcode 10+ | iOS 12.0+ |

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:
		      
```bash
$ gem install cocoapods
```

To integrate SecurityKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SecurityKit'
end
```

Then, run the following command:

```bash
$ pod install
```	
## Installation

### CocoaPods

```ruby
pod 'SecurityKit'
```
		      
## Usage

## JailBroken Device Deteaction

```swift

import SecurityKit

if SecurityKit.isDeviceJailBroken() {
         // Do Something
}else{
        // Do Something
}

```

### Check Device is Simulator

```swift

import SecurityKit

if SecurityKit.isDeviceSimulator() {
      // Do Something
}else{
     // Do Something
}

```

### Reverse Engineering Tools

```swift

import SecurityKit

if SecurityKit.isRevereseEngineeringToolsExecuted() {
       // Do Something
}else{
      // Do Something
}

```

### Check VPN Runs

```swift

import SecurityKit

if SecurityKit.isVPNConnected() {
     // Do Something
}else{
     // Do Something
}

```

### Security Screen Capture

```swift

import SecurityKit

override func viewDidLoad() {
   super.viewDidLoad()
   ScreenCaptureProtection.shared.makeProtection(for: self.view)
}

override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(false)
  ScreenCaptureProtection.shared.removeScreenProtection(for: self.view)
  }

```

### Security Background Layer

```swift

import SecurityKit

var window: UIWindow?

func sceneWillResignActive(_ scene: UIScene) {
// Called when the scene will move from an active state to an inactive state.
// This may occur due to temporary interruptions (ex. an incoming phone call).

guard let image = UIImage(named: "Placeholder") else {return}
SecurityKit.createSecureScreenShot(window: window, image: image)
}
    
func sceneDidBecomeActive(_ scene: UIScene) {
// Called when the scene has moved from an inactive state to an active state.
// Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.

SecurityKit.removeSecureScreenShot(window: &window)
}

```

### XOR String obfuscation

```swift

import SecurityKit

// String Encryption
let encrypt = SecurityKit.stringEncryption(plainText: "plainText", encryptionKey: "key")

// String Decryption
let decrypt = SecurityKit.stringDecryption(cypherText: encrypt, decryptionKey: key)

```
## License

SecurityKit is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
