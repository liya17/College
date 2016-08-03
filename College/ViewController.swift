//
//  ViewController.swift
//  College
//
//  Created by Liya Wu-17 on 7/31/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage
import AlamofireNetworkActivityIndicator

class ViewController: UITableViewController {
    
    var collegesData: [Colleges]!
    
    var filteredColleges = [Colleges]()

    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        guard let jsonURL = NSBundle.mainBundle().URLForResource("college", withExtension: "json") else {
            print("Could not find json!")
            return
        }
        let jsonData = NSData(contentsOfURL: jsonURL)!
        let collegeData = JSON(data: jsonData)
        
        let allCollegesData = collegeData.arrayValue
        
        collegesData = []
        
        //print("The top college is \(allCollegesData.name)")
        
        for college in allCollegesData {
            let currentCollege = Colleges(json: college)
            //add struct into movies array
            collegesData.append(currentCollege)
        }
        
        //NEED TO REMOVE COLLEGES THAT ARE NOT FILLED OUT
        
        print(collegesData!.count)
        tableView.reloadData()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 1
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayCollege" {
                // 3
                // pass information

                print("Transitioning to the Display College View Controller")
                
                let destinationViewController = segue.destinationViewController as! DisplayCollegeViewController
                
                destinationViewController.currentCollege = collegesData[(tableView.indexPathForSelectedRow?.row)!]
            //destination.performSegueWithIdentifier("displayCollege", sender: self)
                
            
            }
        }
    
    }
    
    // 1
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredColleges.count
        }
        return collegesData.count
    }
    
    // 2
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("collegeTableViewCell", forIndexPath: indexPath)
        let college: Colleges
        if searchController.active && searchController.searchBar.text != "" {
            college = filteredColleges[indexPath.row]
        } else {
            college = collegesData[indexPath.row]
        }
        cell.textLabel?.text = college.name
        return cell
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        // 1
//        let cell = tableView.dequeueReusableCellWithIdentifier("collegeTableViewCell", forIndexPath: indexPath) as! CollegeTableViewCell
//        
//        // 2
//        let college = self.collegesData![indexPath.row]
//        cell.collegeNameLabel.text = college.name
//        cell.locationLabel.text = college.stateAbbrev
//        
//        return cell
//    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredColleges = collegesData.filter { college in
            return college.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

