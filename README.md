# Alert

[![CI Status](http://img.shields.io/travis/git/Alert.svg?style=flat)](https://travis-ci.org/git/Alert)
[![Version](https://img.shields.io/cocoapods/v/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)
[![License](https://img.shields.io/cocoapods/l/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)
[![Platform](https://img.shields.io/cocoapods/p/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)

# Summary
The initial version of the library which allows presenting a view for a short time on the screen providing feedback.
The view can be configured through a *Configuration* instance and presented on any UIView.

## Configuration
The following properties can be configured: 

- backgroundColor
- backgroundEffect: type of blur effect 
- titleFont
- subtitleFont
- titleColor
- subtitleColor
- borderRadius
- accessory: default provided or custom defined.
- measure: small, normal, big, full screen or custom. See source code documentation for more details.
- accessoryTintColor
- presentationTime: how much the view remains on the screen
- tapToDismissEnable: should the user touch in the background and dismiss the view?

## Example
An example of the resulting message view: 

![simulator_screen_shot_9 1](https://user-images.githubusercontent.com/815372/28084027-a40bbba0-6677-11e7-947d-38b7f04bda99.png)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Alert is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Alert', :git => "https://github.com/barbaramartina/swift-alert"
```

## Author

git, barbararodeker@gmail.com

## License

Alert is available under the MIT license. See the LICENSE file for more info.
