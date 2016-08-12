//
//  ViewController.swift
//  College
//
//  Created by Liya Wu-17 on 7/31/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift


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
                
        for college in allCollegesData {
            let currentCollege = Colleges(json: college)
            if currentCollege.actCom25 != "" {
                collegesData.append(currentCollege)
            }
        }
                
        print(collegesData!.count)
        tableView.reloadData()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.hidesNavigationBarDuringPresentation = false
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
       
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 168.0/255.0, blue: 18.0/255.0, alpha: 1.0)
        
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor();
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]

    
        searchController.searchBar.barTintColor = UIColor.whiteColor()
        searchController.searchBar.tintColor = UIColor.blackColor()
        searchController.searchBar.placeholder = "Search for a college..."
        
        

    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        let searchBar:UISearchBar = searchController.searchBar
        var searchBarFrame:CGRect = searchBar.frame
        if searchController.active {
            searchBarFrame.origin.y = 10
        }
        else {
            searchBarFrame.origin.y = max(0, scrollView.contentOffset.y + scrollView.contentInset.top)
            
        }
        searchController.searchBar.frame = searchBarFrame
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 1
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayCollege" {
                // 3
                // pass information
                var college: Colleges
                if searchController.active {
                    college = filteredColleges[(tableView.indexPathForSelectedRow?.row)!]
                }
                else {
                    college = collegesData[(tableView.indexPathForSelectedRow?.row)!]
                }
                print("Transitioning to the Display College View Controller")
                
                let destinationViewController = segue.destinationViewController as! DisplayCollegeViewController
            
                destinationViewController.currentCollege = college
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredColleges.count
        }
        return collegesData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 1
        let cell = tableView.dequeueReusableCellWithIdentifier("collegeTableViewCell", forIndexPath: indexPath) as! CollegeTableViewCell
        
        let college: Colleges
        if searchController.active && searchController.searchBar.text != "" {
            college = filteredColleges[indexPath.row]
        } else {
            college = collegesData[indexPath.row]
        }
        
        // 2
        cell.collegeNameLabel.text = college.name
        cell.locationLabel.text = college.stateAbbrev
        
        cell.separatorInset = UIEdgeInsetsZero;
        
        return cell
    }
    
    
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

