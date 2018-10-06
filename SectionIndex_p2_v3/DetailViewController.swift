//
//  DetailViewController.swift
//  SectionIndex_p2_v3
//
//  Created by macbook on 10/3/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person = Person()
    var nameLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        let white = UIColor.whiteColor()
        
        // Add fullname
        view.backgroundColor = UIColor.blackColor()
        
        // Set full name detail for the name lable
        nameLabel.frame = CGRectMake(30, 100, 300, 50)
        nameLabel.font = UIFont.boldSystemFontOfSize(25)
        nameLabel.text = person.fullName
        nameLabel.textColor = white
        view.addSubview(nameLabel)
        
        // Add the mobile title
        let mobile = UILabel(frame: CGRect(x: 30, y: 200, width: 300, height: 50))
        mobile.text = "mobile"
        mobile.textColor = white
        view.addSubview(mobile)
        
        // Add the phone number
        let phone = UILabel(frame: CGRect(x: 30, y: 230, width: 300, height: 50))
        phone.text = person.phone
        phone.textColor = white
        view.addSubview(phone)
        
        // Add the message icon
        let messageIcon = UIImageView(image: UIImage(named: "message"))
        messageIcon.frame = CGRectMake(250, 215, 40, 40)
        view.addSubview(messageIcon)
        
        // Add the phone icon
        let phoneIcon = UIImageView(image: UIImage(named: "phone"))
        phoneIcon.frame = CGRectMake(300, 215, 40, 40)
        view.addSubview(phoneIcon)
    }

}
