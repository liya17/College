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

//import Alamofire
//import AlamofireImage
//import AlamofireNetworkActivityIndicator

class ViewController: UITableViewController {
    
    var collegesData: [Colleges]!
    
    var filteredColleges = [Colleges]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         //notes = RealmHelper.retrieveNotes() //wants to update the notes property every time the ListNotesViewController is loaded
        
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
            //add struct into movies array
            collegesData.append(currentCollege)
        }
        
        //NEED TO REMOVE COLLEGES THAT ARE NOT FILLED OUT
        
        print(collegesData!.count)
        tableView.reloadData()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        //tableView.tableHeaderView = searchController.searchBar
        
        //self.navigationItem.titleView = searchController.searchBar
        
        searchController.hidesNavigationBarDuringPresentation = false
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green: 240.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        UITabBar.appearance().barTintColor = UIColor(red: 0.0/255.0, green: 240.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        let tableHeaderView: UIView = UIView.init(frame: searchController.searchBar.frame)
        tableHeaderView.addSubview(searchController.searchBar)
        self.tableView.tableHeaderView = tableHeaderView
    
//        self.searchController.searchBar.backgroundColor = UIColor.whiteColor()
//        self.searchController.searchBar.layer.borderWidth = 0
//        self.searchController.searchBar.layer.borderColor = UIColor.whiteColor().CGColor
//        self.searchController.searchBar.layer.backgroundColor = UIColor.whiteColor().CGColor
//        self.searchController.searchBar.tintColor = UIColor(red: 0.3, green: 0.63, blue: 0.22, alpha: 1)
//        self.searchController.searchBar.searchBarStyle = UISearchBarStyle.Prominent
//        self.searchController.searchBar.translucent = false
//        let textFieldInsideSearchBar = self.searchController.searchBar.valueForKey("searchField") as? UITextField
//        textFieldInsideSearchBar?.backgroundColor = UIColor.whiteColor()

    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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

                print("Transitioning to the Display College View Controller")
                
                let destinationViewController = segue.destinationViewController as! DisplayCollegeViewController
                
                destinationViewController.currentCollege = collegesData[(tableView.indexPathForSelectedRow?.row)!]

            }
        }
        
        if let identifier = segue.identifier {
            if identifier == "displayNote" {
                print("Table view cell tapped")
                
//                let indexPath = tableView.indexPathForSelectedRow! //uniquely identify each cell only using the row property of its corresponding index path --> use indexPath.row to retrieve the notes from the ntoes array that corresponds to the touched cell
//                let note = notes[indexPath.row]
//                let displayNoteViewController = segue.destinationViewController as! DisplayNotesViewController
//                //destinationViewController --> get access to the Display Note View Controller
//                
//                displayNoteViewController.note = note
//                //setting the note property of the Display Note View Controller to the corresponding to the cell that the user tapped
                
            } else if identifier == "addNote" {
                print("+ button tapped")
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredColleges.count
        }
        return collegesData.count
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("collegeTableViewCell", forIndexPath: indexPath)
//        let college: Colleges
//        if searchController.active && searchController.searchBar.text != "" {
//            college = filteredColleges[indexPath.row]
//        } else {
//            college = collegesData[indexPath.row]
//        }
//        cell.textLabel?.text = college.name
//        cell.textLabel?.text = college.stateAbbrev
//        return cell
//    }
    
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
        //let college = self.collegesData![indexPath.row]
        cell.collegeNameLabel.text = college.name
        cell.locationLabel.text = college.stateAbbrev
        
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

