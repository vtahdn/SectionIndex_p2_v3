//
//  Person.swift
//  SectionIndex_p2_v3
//
//  Created by macbook on 10/3/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import Foundation
class Person {
    
    var maleFirstNames : [String]!
    var femaleFirstNames : [String]!
    var lastNames : [String]!
    var maleMiddleNames : [String]!
    var femaleMiddleNames : [String]!
    
    var fullName : String!
    var lastName : String!
    var firstName : String!
    var middleName : String!
    var phone : String!
    
    var first = true
    
    init() {
        
        // Initial contacts
        if first {
            maleFirstNames = ["Long Hoang", "Long Bii", "Viet Swift Code", "Anh Tuan", "B", "Trung Dung Si", "Quyet Dai Ca", "Quốc", "An", "Brad Pitt", "Tom Cruise", "The Rock", "JM", "Harry Potter"]
            femaleFirstNames = ["Chii Be", "Min", "Ngoc Ha", "Diem Quynh", "Ha Phuong" , "Ha My", "My Tam", "Britney Spears" , "Orchid", "Apple", "Rose", "Channel", "Glasses", "Mirror", "Lip Tatto", "Mu Tat", "Wasasbbi"]
            maleMiddleNames = ["Handsome", "Cool", "Badass", "Solid", "Strong", "Simple", "Powerful", "Smart", "Intelligent", "Clever"]
            femaleMiddleNames = ["Pretty", "Adorable", "Beautiful", "Charming", "Attractive", "Enchanting"]
            lastNames = ["Linh_Ka"]
            first = false
        }
        
        // Random 0 or 1
        let genderIndex = arc4random_uniform(2)
        
        // If the gender is women
        if genderIndex == 0 {
            
            // Get random female middle name
            middleName = femaleMiddleNames[Int(arc4random_uniform(UInt32(femaleMiddleNames.count)))]
            
            // Get random female first name
            firstName = femaleFirstNames[Int(arc4random_uniform(UInt32(femaleFirstNames.count)))]

        } else {
            
            // Get random male middle name
            middleName = maleMiddleNames[Int(arc4random_uniform(UInt32(maleMiddleNames.count)))]
            
            // Get random male first name
            firstName = maleFirstNames[Int(arc4random_uniform(UInt32(maleFirstNames.count)))]
            
        }
        
        // Get random last name
        lastName = lastNames[Int(arc4random_uniform(UInt32(lastNames.count)))]
        
        fullName = lastName + " " + middleName + " " + firstName
        
        phone = "09 - LINH - KA - " + String(format: "%02d", arc4random_uniform(100))
        
    }
    
    
}
