//
//  ListNotesTableViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/7/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit

class ListNotesTableViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // 2
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 3
        let cell = tableView.dequeueReusableCellWithIdentifier("listNotesTableViewCell", forIndexPath: indexPath)
        
        // 4
        cell.textLabel?.text = "Yay - it's working!"
        
        // 5
        return cell
    }

}
