//
//  TableViewController.swift
//  SectionIndex_p2_v3
//
//  Created by macbook on 10/3/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // Save a contact list
    var values: NSMutableArray!
    var contacts = NSMutableDictionary()
    
    // All keys in the "contacts"
    var keys: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Edit the back button
        let backButton = UIBarButtonItem()
        backButton.title = "Linh Ka Team"
        navigationItem.backBarButtonItem = backButton
        
        // Change the arrow color
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        // Title text color for NavigationBar
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(25)]
        
        // Color fot the "right column" background and text (section index)
        self.tableView.sectionIndexBackgroundColor = UIColor.blackColor()
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        
        // Create a contact list.
        values = NSMutableArray()
        
        // Initial 60 contacts.
        for _ in 0..<60 {
            values.addObject(Person())
        }
        
        // Add contacts to "contacts" and "keys"
        for element in values {
            let person = element as! Person
            var firstLetter = (person.firstName as NSString).substringToIndex(1)
            
            // Add special charactoers to the original one.
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            
            if firstLetter == "Á" {
                firstLetter = "A"
            }
            
            var letters: NSMutableArray!
            
            // If there is any element in the "contacts" array follow by the "firstLetter".
            if contacts.valueForKey(firstLetter) != nil {
                
                // Copy values of "contacts" to "letters"
                letters = contacts.valueForKey(firstLetter) as! NSMutableArray
                
                // Add a new contact to "letters"
                letters.addObject(person)
                
                // Update "contacts"
                contacts.setValue(letters, forKey: firstLetter)
                
            } else {
                // If there is not any contact
                
                // Initial a new contact array
                letters = NSMutableArray(object: person)
                
                // Update contacts at the key: "firstLetter"
                contacts.setValue(letters, forKey: firstLetter)
            }
            
        }
        
        keys = contacts.allKeys as! [String]
        
        // Sort alphabetically.
        keys = keys.sortedArrayUsingSelector(#selector(NSNumber.compare(_:)))
    }
    
    // The number of Sections in Table
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return keys.count
    }

    // The Number of rows in each section.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Get a element in the "keys" at the "section" position.
        let key = keys[section]
        
        // Get a value of the "contacts" by the "key".
        let values = contacts[key as! String]
        
        // Return the number of elements in each section.
        return (values?.count)!
    }
    
    // Ttile For Section
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section] as? String
    }

    // Fill data to the tableview
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Create a cell with the "Cell" identifier
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")

        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        
        // Get a element in the "keys" at the "section" position
        let key = keys[indexPath.section]
        
        // Get a value of the "contacts" by the "key".
        let values = contacts[key as! String]
        
        // Get a contact by the indexPath.
        let person = values![indexPath.row] as! Person
        
        // Update the cell detail bythe contact.
        cell?.textLabel?.text = person.fullName
        
        // Add phone numbers.
        cell?.detailTextLabel?.text = person.phone

        return cell!
    }
    
    // Titles for Table (right column)
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return keys as? [String]
    }
    
    // Color for Background and text of Section Title
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.blackColor()
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.whiteColor()
    }
    
    // Take the contact detail to the detail view controller.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailViewController = DetailViewController()
        
        // Get a element in the "keys" at the "section" position.
        let key = keys[indexPath.section]
        
        // Get a value of the "contacts" by the "key".
        let values = contacts[key as! String]
        
        // Get a contact by the indexPath
        let person = values![indexPath.row] as! Person
        
        detailViewController.person = person
        
        navigationController?.pushViewController(detailViewController, animated: true)
    
    }

}













