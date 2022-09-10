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

- [x] Security Background Layer
- [x] Detect Reverse Engineering Tools Executed.
- [x] Check Device is a Simulator or a Real Device.
- [x] Check VPN is running.
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

To integrate TPObfuscation into your Xcode project using CocoaPods, specify it in your `Podfile`:

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
		      
## Usage

### Security Background Layer

```swift

if SecurityKit.isDeviceJailBroken() {
         // Do Something
}else{
        // Do Something
}

```

### Reverse Engineering Tools

```swift

if SecurityKit.isRevereseEngineeringToolsExecuted() {
       // Do Something
}else{
      // Do Something
}

```

### Check Device is Simulator

```swift

if SecurityKit.isDeviceSimulator() {
      // Do Something
}else{
     // Do Something
}

```

### Check VPN Runs

```swift

if SecurityKit.isVPNConnected() {
     // Do Something
}else{
     // Do Something
}

```

### XOR String obfuscation

```swift

// String Encryption
let encrypt = SecurityKit.StringEncryption(plainText: "plainText", encryptionKey: "key")

// String Decryption
let decrypt = SecurityKit.StringDecryption(cypherText: encrypt, decryptionKey: key)

```
## License

SecurityKit is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
