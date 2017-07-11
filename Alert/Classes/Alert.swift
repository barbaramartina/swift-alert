
import UIKit

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

public enum Effect {
    case none
    case blurLight
    case blurExtraLight
    case blurDark
    case blurRegular
    case blurProminent
    
    public func apply(toView view: UIView) {
        switch self {
        case .none:             break
        case .blurLight:        addEffectStyle(.light, toView: view)
        case .blurExtraLight:   addEffectStyle(.extraLight, toView: view)
        case .blurDark:         addEffectStyle(.dark, toView: view)
        case .blurRegular:      addEffectStyle(.regular, toView: view)
        case .blurProminent:    addEffectStyle(.prominent, toView: view)

        }
    }
    
    private func addEffectStyle(_ style: UIBlurEffectStyle, toView view: UIView) {
        let effectView = UIVisualEffectView()
        effectView.frame = view.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectView.effect = UIBlurEffect(style: style)
        view.addSubview(effectView)
    }
}

public enum Animation {
    case none
    case beat

    public func apply(toView view: UIView) {
        switch self {
        case .none:             break
        case .beat:             break //Coming
        }
    }
}

/*
    Set of accessories, through which views can be derived to appear 
    at the top of the alert.
    
    Some default icons are provided. 
    Customisable with any kind of UIView is possible throught the custom case.
 */
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


public func ==(lhs: Accessory, rhs: Accessory) -> Bool {
    switch (lhs, rhs) {
    case (.none,.none):             return true
    case (.delete,.delete):         return true
    case (.edit,.edit):             return true
    case (.like,.like):             return true
    case (.activity,.activity):     return true
    case (.custom(_),.custom(_)):   return true
    default:
        return false
    }
}

/*
    Available sizes for presentation
    Can be a custom size or use one provided
        - Small         20% of the superview height.
                        60% of the superview width.
                        Can show accessory & title. Text will be shrinked to fit.
        - Normal        30% of the superview height.
                        80% of the superview width.
                        Can show accessory, title & subtitle. 
        - Big           80% of the superview height.
                        90% of the superview width
                        Can show accessory, title & subtitle
        - FullScreen    Just the whole superview area. All the elements.
        - Custom        Define your own percentage of the superview you want to cover. 
                        All elements available
                        Percentages <= 1
 */
public enum Measure {
    case small
    case normal
    case big
    case fullscreen
    case custom(widthPercentage: CGFloat,heightPercentage: CGFloat) // must be <= 1
}

/*
    A simple and versatile alert to show quick message for users. 
 
    Elements supported:
            - Background view with blue effects or plain color. Borders rounded possible. 
            - Accessory view provided by default or customisable. TintColor can be applied too.
            - Title label with customisable font and color 
            - Subtitle  with customisable font and color.  
    
    Can be presented in 4 defaults sizes (small, normal, big or full screen) as well as in custom defined areas. All measures are calculated based on the superview.
    The default configuration looks like this:
 
    --------------------------------
 
              🎧🎧🎧🎧
 
          Listening to 🎼
 
        on your favourite music
            application
 
    --------------------------------
 */
public class Alert : UIView {
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: Alert.self)
        let bundleURL = podBundle.url(forResource: "Alert", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
    
    private let backgroundView = UIView()
    private var accessory: UIView?
    private var title = UILabel()
    private var subtitle = UILabel()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        title.textAlignment = .center
        subtitle.textAlignment = .center
        
        title.numberOfLines = 1
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.7
        
        subtitle.numberOfLines = 0
        subtitle.adjustsFontSizeToFitWidth = true
        subtitle.minimumScaleFactor = 0.6
    }
    
    public func show(inView view: UIView, with configuration: Configuration, title: String, subtitle: String = "") {
        
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        // title 
        self.title.text = title
        self.title.font = configuration.titleFont
        self.title.textColor = configuration.titleColor
        
        // subtitle 
        self.subtitle.text = subtitle
        self.subtitle.font = configuration.subtitleFont
        self.subtitle.textColor = configuration.subtitleColor
        
        // accessory
        let acc = configuration.accessory
        if ( acc == Accessory.none ) == false {
            accessory = acc.view()
            if configuration.accessoryTintColor != .clear {
                accessory?.tintColor = configuration.accessoryTintColor
            }
            
            //TODO: add animation for accessory
        }
        
        // background
        backgroundView.backgroundColor = configuration.backgroundColor
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = CGFloat(configuration.borderRadius)
        apply(effect: configuration.backgroundEffect, onView: backgroundView)
        
        // tap to dismiss
        if configuration.tapToDismissEnable == true {
            addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fadeOut)))
        }
        
        // add subviews
        addViews(forMeasure: configuration.measure)
        
        // measures constraints
        constraint(forMeasure: configuration.measure)
        
        if let activityIndicator = accessory as? UIActivityIndicatorView {
            activityIndicator.startAnimating()
        }

        // Present and schedule fadeOut
        fadeIn()
        Timer.scheduledTimer(withTimeInterval: configuration.presentationTime,
                             repeats: false) { timer in
                                timer.invalidate()
                                self.fadeOut()
        }
    }

    // MARK: - Private
    
    private func apply(effect: Effect, onView view: UIView) {
        
        func apply(blurStyle: UIBlurEffectStyle, onView: UIView) {
            
            let effectView = UIVisualEffectView()
            effectView.frame = view.bounds
            effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.addSubview(effectView)
            
            view.backgroundColor = .clear
            let e = UIBlurEffect(style: blurStyle)
            effectView.effect = e
        }
        
        switch effect {
        case .none: break
            
        case .blurDark:
            apply(blurStyle: .dark, onView: view)
            
        case .blurLight:
            apply(blurStyle: .light, onView: view)
            
        case .blurExtraLight:
            apply(blurStyle: .extraLight, onView: view)

        case .blurRegular:
            apply(blurStyle: .regular, onView: view)

        case .blurProminent:
            apply(blurStyle: .prominent, onView: view)
        }
    }
    
    private func addViews(forMeasure measure: Measure) {
        switch measure {
        case .small:
            subtitle.removeFromSuperview()

            addSubview(backgroundView)
            backgroundView.addSubview(title)
            if let acc = accessory { backgroundView.addSubview(acc) }
            
        case .normal:       fallthrough
        case .big:          fallthrough
        case .fullscreen:   fallthrough
        case .custom(_, _):
            addSubview(backgroundView)
            backgroundView.addSubview(title)
            backgroundView.addSubview(subtitle)
            if let acc = accessory { backgroundView.addSubview(acc) }
        }
    }
    
    private func constraint(forMeasure measure: Measure) {

        backgroundView.removeConstraints(backgroundView.constraints)
        title.removeConstraints(title.constraints)
        subtitle.removeConstraints(subtitle.constraints)
        
        backgroundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        accessory?.translatesAutoresizingMaskIntoConstraints = false
        
        switch measure {
        case .small:
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6).isActive = true
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
            
            if let acc = accessory {
                acc.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10).isActive = true
                acc.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
                acc.setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .vertical)
                acc.setContentHuggingPriority(UILayoutPriorityDefaultHigh, for: .horizontal)
                
                title.bottomAnchor.constraint(greaterThanOrEqualTo: backgroundView.bottomAnchor, constant: -10).isActive = true
                title.topAnchor.constraint(equalTo: acc.bottomAnchor, constant: 15).isActive = true
                title.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 15).isActive = true
                title.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -15).isActive = true
                
            } else {
                title.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
                title.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
            }
        
        case .custom(let widthPercentage, let heightPercentage):
            
            assert(widthPercentage <= 1 && heightPercentage <= 1)
            
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: widthPercentage).isActive = true
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightPercentage).isActive = true
            
            addSharedConstraints()
            
        case .normal:
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor, multiplier:  0.8).isActive = true
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
            
            addSharedConstraints()

        case .big:
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9).isActive = true

            addSharedConstraints()

        case .fullscreen:
            backgroundView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            backgroundView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true

            if let acc = accessory {
                acc.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
                acc.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: -50).isActive = true

                title.topAnchor.constraint(greaterThanOrEqualTo: acc.bottomAnchor, constant: 15).isActive = true
                title.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 15).isActive = true
                title.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -15).isActive = true
                
            } else {
                title.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
                title.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
            }
            
            subtitle.bottomAnchor.constraint(greaterThanOrEqualTo: backgroundView.bottomAnchor, constant: -15).isActive = true
            subtitle.topAnchor.constraint(greaterThanOrEqualTo: title.bottomAnchor, constant: 15).isActive = true
            subtitle.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 15).isActive = true
            subtitle.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -15).isActive = true
        
        }
    }
    
    private func addSharedConstraints() {
        if let acc = accessory {
            acc.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15).isActive = true
            acc.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
            title.topAnchor.constraint(equalTo: acc.bottomAnchor, constant: 15).isActive = true
            title.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 15).isActive = true
            title.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -15).isActive = true
            
        } else {
            title.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
            title.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        }
        
        subtitle.bottomAnchor.constraint(greaterThanOrEqualTo: backgroundView.bottomAnchor, constant: -15).isActive = true
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15).isActive = true
        subtitle.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 15).isActive = true
        subtitle.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -15).isActive = true
    }
    
    private func fadeIn() {
        alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1
        }
    }
    
    @objc private func fadeOut() {

        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.alpha = 0
        }) { finished in
            self.removeFromSuperview()
        }
    }

}
