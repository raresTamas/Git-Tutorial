//
//  DecodableViewController.swift
//  Git Tutorial
//
//  Created by Rares Tamas on 28/11/2018.
//  Copyright © 2018 Rares. All rights reserved.
//

import UIKit
import Foundation

// 1 single object or array of objects
struct CourseObject: Decodable {

    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?

}


// 2 an object wich contains multiple values and an array
struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [CourseObject]
}

class ecodableViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "aaa"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                // 1 single object or array of objects
//                let course = try JSONDecoder().decode(CourseObject.self, from: data) // one object
//                print("aaa: \(course.id)")
                // OR AN ARRAY OF OBJECTS
//                let courses = try JSONDecoder().decode([CourseObject].self, from: data) // array of objects
//                print("aaa: \(courses)")
                
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
            } catch {
                
                print("parsing error")
                
            }
        }
    }
}
