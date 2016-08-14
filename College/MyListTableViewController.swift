//
//  myListTableViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/7/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class MyListTableViewController: UITableViewController {
    
    //array that is passed from DisplayCollegeViewController
    var array = []
    
    var college: Colleges!
    
    var myArray = []
    
    var ourText = String()
    
    var textArray:[String] = [String]()
    
    var colleges: Results<Colleges>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor();
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        self.clearsSelectionOnViewWillAppear = false
        
        self.colleges = RealmHelper.retrieveColleges()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 255.0/255.0, green: 168.0/255.0, blue: 18.0/255.0, alpha: 1.0)
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        self.colleges = RealmHelper.retrieveColleges()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  colleges.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
       let cell = tableView.dequeueReusableCellWithIdentifier("selectedCollegeTableViewCell", forIndexPath: indexPath) as! SelectedCollegeTableViewCell
        
        let row = indexPath.row
        cell.collegeName.text = colleges[row].name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "favCollege" {
            let destinationVC = segue.destinationViewController as! DisplayCollegeViewController
            
            college = colleges[(tableView.indexPathForSelectedRow?.row)!]
            destinationVC.currentCollege = college
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        // 2
        if editingStyle == .Delete {
            //1
            RealmHelper.deleteColleges(colleges[indexPath.row])
            //2
            colleges = RealmHelper.retrieveColleges()
        }
    }


}
