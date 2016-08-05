//
//  myListViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/5/16.
//  Copyright © 2016 ms. All rights reserved.
//

//import UIKit
//
//class myListViewController: UIViewController {
//    
//    var testPropery: [Array]
//    
//    
//
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // 1
//        if let identifier = segue.identifier {
//            // 2
//            if identifier == "displayCollege" {
//                // 3
//                // pass information
//                
//                print("Transitioning to the Display College View Controller")
//                
//                let destinationViewController = segue.destinationViewController as! DisplayCollegeViewController
//                
//                destinationViewController.currentCollege = collegesData[(tableView.indexPathForSelectedRow?.row)!]
//                //destination.performSegueWithIdentifier("displayCollege", sender: self)
//            }
//        }
//    }
//    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //selected colleges is defined in display college view controller
//        return selectedColleges.count
//    }
//    
//    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        // 1
//        let cell = tableView.dequeueReusableCellWithIdentifier("collegeTableViewCell", forIndexPath: indexPath) as! CollegeTableViewCell
//        
//        let college: Colleges
//        if searchController.active && searchController.searchBar.text != "" {
//            college = filteredColleges[indexPath.row]
//        } else {
//            college = collegesData[indexPath.row]
//        }
//        
//        // 2
//        //let college = self.collegesData![indexPath.row]
//        cell.collegeNameLabel.text = college.name
//        cell.locationLabel.text = college.stateAbbrev
//        
//        return cell
//    }
//
//    
//}
