# Swift Alert

[![CI Status](http://img.shields.io/travis/git/Alert.svg?style=flat)](https://travis-ci.org/git/Alert)
[![Version](https://img.shields.io/cocoapods/v/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)
[![License](https://img.shields.io/cocoapods/l/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)
[![Platform](https://img.shields.io/cocoapods/p/Alert.svg?style=flat)](http://cocoapods.org/pods/Alert)

![simulator_screen_shot_9 1](https://user-images.githubusercontent.com/815372/28084027-a40bbba0-6677-11e7-947d-38b7f04bda99.png)


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

```swift
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

### Background effects

Different type of blur effects can be selected. **If a background color was set that will be removed. Effects take precedence**.

```swift
public enum Effect {
    case none
    case blurLight
    case blurExtraLight
    case blurDark
    case blurRegular
    case blurProminent
}
```

### Measures

By default you can choose between these measures: 

- small
- normal 
- big
- full screen

Or defined your custom measure, by providing a percentage of the width and height of the superview you want to cover. 

```swift
public enum Measure {
    case small
    case normal
    case big
    case fullscreen
    case custom(widthPercentage: CGFloat,heightPercentage: CGFloat) // must be <= 1
}
```

### Accessories

A top view can be added by using the default provided accessories or defining a custom one 

```swift
public enum Accessory {
    case none
    case delete
    case edit
    case like
    case activity
    case custom(view: UIView)
    
    public func view() -> UIView {
        switch self {
        case .none:                 return UIView()
        case .delete:               return UIImageView(image: UIImage(named: "delete",
                                                                  in: Alert.bundle,
                                                                  compatibleWith: nil)?.withRenderingMode(.alwaysTemplate))
        case .edit:                 return UIImageView(image: UIImage(named: "edit",
                                                                in: Alert.bundle,
                                                                compatibleWith: nil)?.withRenderingMode(.alwaysTemplate))
        case .like:                 return UIImageView(image: UIImage(named: "like",
                                                                in: Alert.bundle,
                                                                compatibleWith: nil)?.withRenderingMode(.alwaysTemplate))
        case .activity:             return UIActivityIndicatorView(activityIndicatorStyle: .gray)
        case .custom(let v):        return v
        }
    }
}
```

## Example
Some example of the resulting message view: 

![simulator_screen_shot_9 1](https://user-images.githubusercontent.com/815372/28084027-a40bbba0-6677-11e7-947d-38b7f04bda99.png)

![Example 2](https://github.com/barbaramartina/swift-alert/blob/master/Resources/Simulator_Screen_Shot_9%20(1).png)
![Example 3](https://github.com/barbaramartina/swift-alert/blob/master/Resources/Simulator_Screen_Shot_9%20(3).png)

### Animated image example 

Animated images into image views are also a possibility (any kind of UIView subclass indeed).

```swift
        let anotherContainer = UIView(frame: .zero)
        view.addSubview(anotherContainer)
        anotherContainer.translatesAutoresizingMaskIntoConstraints = false
        anotherContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        anotherContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        anotherContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        anotherContainer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        anotherContainer.widthAnchor.constraint(greaterThanOrEqualToConstant: 300).isActive = true
        view.layoutSubviews()
        
        let img = UIImage.animatedImageNamed("man", duration: 1)
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imgView.image = img
        imgView.contentMode = .scaleToFill
        
        
                        alert.show(inView: anotherContainer,
                                   with: Configuration(backgroundColor: .clear,
                                                       backgroundEffect: .blurLight,
                                                       titleFont: UIFont.systemFont(ofSize: 16),
                                                       titleColor: .darkText,
                                                       accessory: .custom(view: imgView),
                                                       measure: .fullscreen,
                                                       accessoryTintColor: UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)),
                                   title: "Let's go for a walk!",
                                   subtitle: "")

```

You can achieve something like this with the code above:

![Example Animated](https://github.com/barbaramartina/swift-alert/blob/master/Resources/letswalk.gif)



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
