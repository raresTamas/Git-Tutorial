//
//  ViewController.swift
//  Git Tutorial
//
//  Created by Rares Tamas on 15/11/2018.
//  Copyright © 2018 Rares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // example
    var isIncoming: Bool! {
        didSet {
            self.view.backgroundColor = isIncoming ? UIColor.red : UIColor.blue
        }
    }
    
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    let countingLabel: UILabel! = {
        let label = UILabel()
        label.text = "1234"
        label.textAlignment = .center
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 25, weight: .medium) // //UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.textColor = UIColor(white: 1, alpha: 0.4)
        return label
    }()
    
    let shinyLabel: UILabel! = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 25, weight: .medium) // //UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 0
        label.textColor = UIColor(white: 1, alpha: 1.0)
        return label
    }()
    
    var displayLink = CADisplayLink()
    let animationsStartDate = Date()
    var startValue: Double = 0
    let endValue: Double = 1254
    let animationDuration: Double = 2.5
    
    
    var startIndexText = 0
    var startText = ""
    var endText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(shinyLabel)
        self.shinyLabel.frame = view.frame
        
        self.view.addSubview(countingLabel)
        self.countingLabel.frame = view.frame
    
        self.doAnimation()
        
        self.isIncoming = false
    }

    
    fileprivate func doAnimation() {
        // create CADisplayLink
        displayLink = CADisplayLink(target: self, selector: #selector(handleUpdate))
        displayLink.add(to: .main, forMode: .default)
    }
    
    @objc func handleUpdate() {

        
        
        // 1
//        let now = Date()
//        let elapsedTime = now.timeIntervalSince(animationsStartDate)
//
//        if elapsedTime > animationDuration {
//            self.countingLabel.text = "\(Int(endValue))"
//            displayLink.remove(from: .current, forMode: .default) // this is how you stop de CADisplayLink
//        } else {
//            let percentage = elapsedTime / animationDuration
//            let value = startValue + percentage * (endValue - startValue)
//            self.countingLabel.text = "\(Int(value))"
//        }

        
        
        // 2
        let mySubstring = self.endText.prefix(self.startIndexText)
        self.countingLabel.text = "\(mySubstring)"
        self.startIndexText += 1

        if self.startIndexText >= self.endText.count {
            self.countingLabel.text = self.endText
            self.shinyLabel.text = self.endText
            displayLink.remove(from: .current, forMode: .default) // this is how you stop de CADisplayLink
            
            self.createGradient()
        }
        
        
        
        // 3
//        self.countingLabel.text = "\(startValue)"
//        self.startValue += 1
//        if startValue > endValue {
//            self.startValue = endValue
//        displayLink.remove(from: .current, forMode: .default) // this is how you stop de CADisplayLink
//        }

    }
    
    fileprivate func createGradient() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.4 , 0.5, 0.6]
        gradientLayer.frame = self.view.frame
        
        let angle = 90 * CGFloat.pi / 180
        gradientLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
        
        self.shinyLabel.layer.mask = gradientLayer
        
        // animation
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
        
        gradientLayer.add(animation, forKey: "transform.translation.x")
        
    }
}

