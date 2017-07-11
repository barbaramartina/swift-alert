//
//  ViewController.swift
//  Alert
//
//  Created by Barbara Rodeker on 06/29/2017.
//  Copyright (c) 2017 git. All rights reserved.
//

import UIKit
import Alert

class ViewController: UIViewController {
    
    
    static var bundle:Bundle {
        let podBundle = Bundle(for: Alert.self)
        let bundleURL = podBundle.url(forResource: "Alert", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
    
    let alert = Alert()
    let img = UIImage(named: "cloud", in: bundle, compatibleWith: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(UIImageView(image: img))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Example 1
//        alert.show(inView: view,
//                   with: Configuration(backgroundColor: .blue,
//                                       backgroundEffect: .blurLight,
//                                       accessory: .edit,
//                                       measure: .custom(widthPercentage: 0.5, heightPercentage: 0.3),
//                                       accessoryTintColor: .purple),
//                   title: "Choose a color", subtitle: "And then will be applied to the background of your photo")
        
        // Example 2
//        alert.show(inView: view,
//                   with: Configuration(backgroundColor: .blue,
//                                       backgroundEffect: .blurDark,
//                                       titleFont: UIFont.systemFont(ofSize: 16),
//                                       subtitleFont: UIFont.systemFont(ofSize: 13),
//                                       titleColor: .white,
//                                       subtitleColor: .lightGray,
//                                       accessory: .edit,
//                                       measure: .custom(widthPercentage: 0.5, heightPercentage: 0.3),
//                                       accessoryTintColor: .white),
//                   title: "Choose a color",
//                   subtitle: "And then will be applied to the background of your photo")

        // Example 3
//        alert.show(inView: view,
//                   with: Configuration(backgroundColor: .clear,
//                                       backgroundEffect: .blurExtraLight,
//                                       titleFont: UIFont.systemFont(ofSize: 16),
//                                       subtitleFont: UIFont.systemFont(ofSize: 13),
//                                       titleColor: .gray,
//                                       subtitleColor: .lightGray,
//                                       accessory: .activity,
//                                       measure: .normal,
//                                       accessoryTintColor: .green),
//                   title: "Choose a color",
//                   subtitle: "And then will be applied to the background of your photo")

        // Example 4
//        alert.show(inView: view,
//                   with: Configuration(backgroundColor: .clear,
//                                       backgroundEffect: .blurRegular,
//                                       titleFont: UIFont.systemFont(ofSize: 16),
//                                       subtitleFont: UIFont.systemFont(ofSize: 13),
//                                       titleColor: .green,
//                                       subtitleColor: .green,
//                                       accessory: .activity,
//                                       measure: .normal,
//                                       accessoryTintColor: .green),
//                   title: "",
//                   subtitle: "Uploading your pictures")

        // Example 5
//                alert.show(inView: view,
//                           with: Configuration(backgroundColor: .clear,
//                                               backgroundEffect: .blurProminent,
//                                               titleFont: UIFont.systemFont(ofSize: 10),
//                                               titleColor: .magenta,
//                                               accessory: .like,
//                                               measure: .small,
//                                               accessoryTintColor: .magenta),
//                           title: "Thanks for sharing!",
//                           subtitle: "")

        // Example 6
        
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

    }

}

