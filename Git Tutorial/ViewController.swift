//
//  ViewController.swift
//  Git Tutorial
//
//  Created by Rares Tamas on 15/11/2018.
//  Copyright © 2018 Rares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    let message: String = "Hello ladies!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("message:    \(reverse(text: message))")
        
        self.nameLabel.text = self.reverse(text: message)
    }

    func reverse( text: String) -> String {
        
        return String(text.reversed())
    }

}

