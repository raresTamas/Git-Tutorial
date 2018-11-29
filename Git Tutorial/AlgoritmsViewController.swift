//
//  AlgoritmsViewController.swift
//  Git Tutorial
//
//  Created by Rares Tamas on 29/11/2018.
//  Copyright © 2018 Rares. All rights reserved.
//

import UIKit
import Foundation

class AlgoritmsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Algorithm 1
    fileprivate func fizBuzzAlgoritm() {
        
        let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 8, 10, 11, 12, 13, 14, 15]
        
        for num in numbers {
            if num % 3 == 0 && num % 5 == 0 {
                print("\(num) fizz buzz")
            } else if num % 3 == 0 {
                print("\(num) fizz")
            } else if num % 5 == 0 {
                print("\(num) buzz")
            } else {
                print("\(num)")
            }
        }
    }
    
    
    // Algorithm 2
    fileprivate func search() {
    
        let numbers = [1, 5, 6, 8, 10, 13, 16, 17, 18, 19, 20]
        
        print("linearSearch:   \(self.linearSearchForValue(searchValue: 5, array: numbers))")
        
        print("binatySearch:   \(self.binarySearchForValue(searchValue: 4, array: numbers))")
    }
    
    func linearSearchForValue(searchValue: Int, array: [Int]) -> Bool {

        for num in array {
            if num == searchValue {
                
                return true
            }
        }
        
        return false
    }
    
    
    func binarySearchForValue(searchValue: Int, array: [Int]) -> Bool {
        
        let leftIndex = 0
        var rightIndex = array.count - 1
        
        while leftIndex <= rightIndex {
            
            let middleIndex = (leftIndex + rightIndex) / 2
            let middleValue = array[middleIndex]
            
            if middleValue == searchValue {
                return true
            }
            
            if searchValue < middleValue {
                rightIndex = middleIndex - 1
            }
            
            if searchValue > middleValue {
                rightIndex = middleIndex + 1
            }
        }
        
        return false
    }
}
