//
//  KeyFrameAbimationViewController.swift
//  Git Tutorial
//
//  Created by Rares Tamas on 27/11/2018.
//  Copyright © 2018 Rares. All rights reserved.
//

import UIKit
import Foundation

class KeyFrameAbimationViewController: UIViewController {
    
//    let viewToAnimate: UIView! = {
//        let view = UIView()
//        view.backgroundColor = UIColor.red
//        return view
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewToAnimate = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        viewToAnimate.backgroundColor = UIColor.blue
        viewToAnimate.center = self.view.convert(self.view.center, from: viewToAnimate)

        self.view.addSubview(viewToAnimate)
        
        self.keyFrameAnimatiion(for: viewToAnimate)
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func keyFrameAnimatiion(for myView: UIView) {
        
        let overallAnimationDuration: Double = 6
        
        UIView.animateKeyframes(withDuration: overallAnimationDuration,
                                delay: 0,
                                options: [.calculationModeLinear, .autoreverse],
                                animations: {
            
                                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.15, animations: {
                                        myView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi / 2))
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 2 / overallAnimationDuration, relativeDuration: 0.2, animations: {
                                        myView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi / 2))
                                    
                                        let moveRight = CGAffineTransform(translationX: 125, y: 0)
                                        myView.backgroundColor = UIColor.red
                                        myView.transform = moveRight
                                        myView.layer.cornerRadius = myView.frame.height / 2
                                        
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 3 / overallAnimationDuration, relativeDuration: 0.2, animations: {
                                        myView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi / 2))
                                        
                                        let moveUp = CGAffineTransform(translationX: 125, y: -100)
                                        myView.backgroundColor = UIColor.green
                                        myView.alpha = 0.3
                                        myView.transform = moveUp
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 4 / overallAnimationDuration, relativeDuration: 0.3, animations: {
                                        myView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi / 2))
                                        
                                        let moveLeft = CGAffineTransform(translationX: 0, y: -100)
                                        myView.backgroundColor = UIColor.green
                                        myView.transform = moveLeft
                                        myView.alpha = 1.0
                                        myView.layer.cornerRadius = 0
                                    })
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 5 / overallAnimationDuration, relativeDuration: 0.3, animations: {
                                        myView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi / 2))
                                        
                                        let moveCenter = CGAffineTransform(translationX: 0, y: 0)
                                        myView.backgroundColor = UIColor.blue
                                        myView.transform = moveCenter
                                    })
                                    
                                    
        }) { finished in
            print("animation completed")
            
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = -Double.pi * 2 //Minus can be Direction
            rotationAnimation.duration = 1
            rotationAnimation.repeatCount = .infinity
            myView.layer.add(rotationAnimation, forKey: nil)
        }
    }
}
