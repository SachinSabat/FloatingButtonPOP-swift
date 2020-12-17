# FloatingButtonPOP-swift
Add float button in your project | Supported to Swift (world first Protocol Oriented Language)

[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

FloatingButtonPOP-swift is a framework with a lot of access to change it's UI which will help you to add Float button in your iOS App.

## Features

- [x] Protocol Oriented based Implementation
- [x] Light Weigth code

## Requirements

- iOS 10.0+
- Xcode 10.0+
- Swift 4.0+

## Installation

#### CocoaPods
You can use [CocoaPods](https://cocoapods.org/pods/FloatingButtonPOP-swift) to install `FloatingButtonPOP-swift` by adding it to your `Podfile`:

```ruby
platform :ios, '10.0'
use_frameworks!
pod 'FloatingButtonPOP-swift'
```
## Usage example

```swift
// Step 1:- Import FloatingButtonPOP_swift below your import UIKit.
import FloatingButtonPOP_swift
// Step 2:- Include Delegate "FloaterViewDelegate" in your particular ViewController.
class ViewController: UIViewController, FloaterViewDelegate {
// Delegate method to capture name and index on the respective button tapped.
func userDidTapOnItem(at index: Int, with model: String) {
               print(model)
               print(index)
}
override func viewDidLoad() {
// Step 3:- Provide array of tuples for float buttons and one tuple for main button with dropShadow option as a bool value.
addFloaterMenu(with: [("Facebook", UIImage(named: "facebook")),("Instagram", UIImage(named: "instagram"))], mainItem: ("Connect", UIImage(named: "share")), dropShadow: true)
}
}
```
## Tutorial
[Medium](https://medium.com/@sabat.sachin33/ios-create-floating-button-in-your-app-by-using-floatingbuttonpop-swift-29e096fceb1d)

## Contribute

We would love you for the contribution to **FloatingButtonPOP-swift**, check the ``LICENSE`` file for more info.

## Meta

Sachin Sabat – [LinkedIn](https://www.linkedin.com/in/sachin-sabat-b9481831/) – sabat.sachin33@gmail.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[GitHub](https://github.com/SachinSabat)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
