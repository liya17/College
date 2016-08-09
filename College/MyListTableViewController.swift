//
//  myListTableViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/7/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import SwiftyJSON

class MyListTableViewController: UITableViewController {
    
    //array that is passed from DisplayCollegeViewController
    //var array: [Colleges]!
    var array: [String]!
    
    var college: Colleges!
    
    var myArray: [NSUserDefaults] = []
    
    //var selectedColleges = [String]()
    
    //var selectedColleges = [String]()
    
    //let kUserDefault = NSUserDefaults.standardUserDefaults()

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.delegate = self
        
//        print("aksjdlfkaj", NSUserDefaults.standardUserDefaults().dictionaryRepresentation().values)
//        
//        let test = NSUserDefaults .standardUserDefaults () .objectForKey ( "selectedColleges" )
//        print( "We saved this data: \( test )" )
//        
//        let tabledata = NSUserDefaults.standardUserDefaults().objectForKey("selectedColleges")
//        
//        print("ok ladies: ", tabledata)
//        
//        myArray = [tabledata! as! NSUserDefaults]
//        
//        print(myArray.count)
//        print(myArray)
//        tableView.reloadData()
        
        //        NSUserDefaults.standardUserDefaults().setObject(array, forKey: "selectedColleges")
        //
        //        let tabledata = NSUserDefaults.standardUserDefaults().objectForKey("selectedColleges")
        
        //array = [tabledata! as! String]
        //tableView.reloadData()
        
        //        print(tabledata)
        
        // print(college)
        //print(array)
        
        //print(college)
        
        navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        
        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Do any additional setup after loading the view, typically from a nib.
        guard let jsonURL = NSBundle.mainBundle().URLForResource("college", withExtension: "json")
            else{
                print("Could not find json!")
                return
        }
        
        
        //        let jsonData = NSData(contentsOfURL: jsonURL)!
        //
        //        let selectedData = JSON(data:jsonData)
        //
        //        let selectedCollegeData = selectedData.arrayValue
        //
        //        selectedColleges = []
        //
        //        selectedColleges.append(college.name)
        //
        //        print(selectedColleges.count)
        //        tableView.reloadData()
        
        
        //NEED TO REMOVE COLLEGES THAT ARE NOT FILLED OUT
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        tableView.delegate = self
//        
//    print("aksjdlfkaj", NSUserDefaults.standardUserDefaults().dictionaryRepresentation().values)
//        
//        let test = NSUserDefaults .standardUserDefaults () .objectForKey ( "selectedColleges" )
//        print( "We saved this data: \( test )" )
//        
//        let tabledata = NSUserDefaults.standardUserDefaults().objectForKey("selectedColleges")
//        
//        //myArray = [tabledata!]
//        //myArray = tabledata
//        
//        print(myArray.count)
//        print(myArray)
//        tableView.reloadData()
//
//        NSUserDefaults.standardUserDefaults().setObject(array, forKey: "selectedColleges")
//
//        let tabledata = NSUserDefaults.standardUserDefaults().objectForKey("selectedColleges")
//        
//        //array = [tabledata! as! String]
//        //tableView.reloadData()
//        
//        print(tabledata)
//
//       // print(college)
//       //print(array)
//        
//        //print(college)
//        
//        navigationController?.navigationBar.barTintColor = UIColor.orangeColor()
//        
//        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
//        
//        // Uncomment the following line to preserve selection between presentations
//        self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem()
//        
//        // Do any additional setup after loading the view, typically from a nib.
//        guard let jsonURL = NSBundle.mainBundle().URLForResource("college", withExtension: "json")
//            else{
//                print("Could not find json!")
//                return
//        }
        
        
//        let jsonData = NSData(contentsOfURL: jsonURL)!
//        
//        let selectedData = JSON(data:jsonData)
//        
//        let selectedCollegeData = selectedData.arrayValue
//        
//        selectedColleges = []
//        
//        selectedColleges.append(college.name)
//        
//        print(selectedColleges.count)
//        tableView.reloadData()
    
        
        //NEED TO REMOVE COLLEGES THAT ARE NOT FILLED OUT
        
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
        return myArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
       let cell = tableView.dequeueReusableCellWithIdentifier("selectedCollegeTableViewCell", forIndexPath: indexPath) as! SelectedCollegeTableViewCell
        
        let row = indexPath.row
        
        let colUnitID = myArray[row]
        
        cell.collegeName.text = (colUnitID as! String)
        
        //cell.collegeName.text = "lol"

//        cell.collegeName.text = college.name    
//        cell.collegeLocation.text = college.stateAbbrev
        
        //cell.collegeName.text = "hey"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
