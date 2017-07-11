# Swift Alert

[![CI Status](http://img.shields.io/travis/git/Alert.svg?style=flat)](https://travis-ci.org/git/Alert)
[![Version](https://img.shields.io/cocoapods/v/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)
[![License](https://img.shields.io/cocoapods/l/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)
[![Platform](https://img.shields.io/cocoapods/p/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)

# Overview

**Alert** is a subclass of *UIView* which contains a title, subtitle & an accessory view. **Alert** allows presenting a view for a short time on the screen providing feedback for the user. It's a small utility library, easy to use in case you don't need to configure too many parameters, and at the same time versatile enoguh to be customisable with your defined accessories (which can be anything inheriting from UIView), title & subtitle font, colors, tintColor of the accessory, measures, blur effect type or background color, border radius, presentation time, tap handling.


## Configuration
The view can be configured through a *Configuration* instance and presented on any UIView.
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

A *Configuration* is an struct containing the mentioned variables and providing default values for all on the in its initializer. 

```
public struct Configuration {
    let backgroundColor: UIColor
    let backgroundEffect: Effect
    let titleFont: UIFont
    let subtitleFont: UIFont
    let titleColor: UIColor
    let subtitleColor: UIColor
    let borderRadius: Float
    let accessory: Accessory
    let accessoryAnimation: Animation
    let measure: Measure
    let accessoryTintColor: UIColor
    let presentationTime: TimeInterval
    let tapToDismissEnable: Bool
    
    public init(backgroundColor: UIColor = .lightGray,
                         backgroundEffect: Effect = .none,
                         titleFont: UIFont = UIFont.systemFont(ofSize: 16),
                         subtitleFont: UIFont = UIFont.systemFont(ofSize: 13),
                         titleColor: UIColor = .black,
                         subtitleColor: UIColor = .black,
                         borderRadius: Float = 6,
                         accessory: Accessory = .none,
                         accessoryAnimation: Animation = .none,
                         measure: Measure = .normal,
                         accessoryTintColor: UIColor = .clear,
                         presentationTime: TimeInterval = 5,
                         tapToDismiss: Bool = true) {
        
        self.backgroundColor = backgroundColor
        self.backgroundEffect = backgroundEffect
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.borderRadius = borderRadius
        self.accessory = accessory
        self.measure = measure
        self.accessoryAnimation = accessoryAnimation
        self.accessoryTintColor = accessoryTintColor
        self.presentationTime = presentationTime
        self.tapToDismissEnable = tapToDismiss
    }
}
```

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
