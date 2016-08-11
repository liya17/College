//
//  DisplayCollegeViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/1/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class DisplayCollegeViewController: UIViewController {

    @IBOutlet weak var currentCollegeNameLabel: UILabel!

    @IBOutlet weak var admissionRateLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var inStateLabel: UILabel!
    
    @IBOutlet weak var outStateLabel: UILabel!
    
    @IBOutlet weak var financialAidLabel: UILabel!
    
    @IBOutlet weak var totalAppLabel: UILabel!
    
    @IBOutlet weak var totalEnrolledLabel: UILabel!
    
    @IBOutlet weak var satC25: UILabel!
    
    @IBOutlet weak var satC75: UILabel!
    
    @IBOutlet weak var satW25: UILabel!
    
    @IBOutlet weak var satW75: UILabel!
    
    @IBOutlet weak var satM25: UILabel!
    
    @IBOutlet weak var satM75: UILabel!
    
    @IBOutlet weak var actC25: UILabel!
    
    @IBOutlet weak var actC75: UILabel!
    
    @IBOutlet weak var actE25: UILabel!
    
    @IBOutlet weak var actE75: UILabel!
    
    @IBOutlet weak var actM25: UILabel!
    
    @IBOutlet weak var actM75: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    var currentCollege: Colleges!
    
    var selectedColleges = [AnyObject]()
    
    var selectedLocation = [String]()
    
    var otherArray = [String]()
    
    var notes: Results<Note>!
    
    //var college: Colleges!
    
    //let userDefaults = [String]()
    
    let kUserDefault = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //college = currentCollege
        
        guard let jsonURL = NSBundle.mainBundle().URLForResource("college", withExtension: "json")
            else{
                print("Could not find json!")
                return
        }
        
        let jsonData = NSData(contentsOfURL: jsonURL)!
        
        let selectedData = JSON(data:jsonData)
        
        let selectedCollegeData = selectedData.arrayValue
        
        selectedColleges = []
        
        selectedLocation = []

        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        currentCollegeNameLabel.text = currentCollege.name
        
        // Swift
        currentCollegeNameLabel.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
        currentCollegeNameLabel.numberOfLines = 0
        
        //ADMISSION RATE
        admissionRateLabel.text = currentCollege.percentAdmitted + "%"
        
        stateLabel.text = currentCollege.stateAbbrev
        
        inStateLabel.text = "$" + currentCollege.inStatePrice
        
        outStateLabel.text = "$" + currentCollege.outStatePrice
        
        financialAidLabel.text = currentCollege.financialAid
        
        totalAppLabel.text = currentCollege.applicantsTotal
        
        totalEnrolledLabel.text = currentCollege.enrolledTotal
        
        satC25.text = currentCollege.satCritical25
        
        satC75.text = currentCollege.satCritical75
        
        satM25.text = currentCollege.satMath25
        
        satM75.text = currentCollege.satMath75
       
        satW25.text = currentCollege.satWriting25
        
        satW75.text = currentCollege.satWriting75
     
        actC25.text = currentCollege.actCom25
        
        actC75.text = currentCollege.actCom75
     
        actE25.text = currentCollege.actE25
        
        actE75.text = currentCollege.actE75
       
        actM25.text = currentCollege.actMath25
        
        actM75.text = currentCollege.actMath75
        
    }

    // ADD COLLEGE TO MYLIST
    @IBAction func heartButtonTapped(sender: AnyObject) {
        RealmHelper.addCollege(currentCollege)
        
        //COLLEGE NAME
//        let prefs = NSUserDefaults.standardUserDefaults()
//        //prefs.removeObjectForKey("selectedColleges")
//        if (prefs.objectForKey("selectedColleges") as? [String]) != nil {
//        var iheartcollege = prefs.objectForKey("selectedColleges") as! [AnyObject]
//            //heartButton.enabled = false
//            //if !iheartcollege.contains(currentCollege as! AnyObject) {
//                iheartcollege.append(currentCollege as! AnyObject)
//            //}
//            prefs.setObject(iheartcollege, forKey: "selectedColleges")
//        } else {
//            //if !selectedColleges.contains(currentCollege as! AnyObject) {
//                //selectedColleges.append(currentCollege as! AnyObject)
//            //}
//            //prefs.setObject(selectedColleges, forKey: "selectedColleges")
//        }
//        var iheartcollege = prefs.objectForKey("selectedColleges") as! [AnyObject]
//        iheartcollege.append(currentCollege as! AnyObject)
//        prefs.setObject([currentCollege as! AnyObject], forKey: "selectedColleges")
//        
//        let userDefaults = prefs.objectForKey("selectedColleges") as! [String]
//        print("lol", userDefaults)
        
        
        //COLLEGE LOCATION
//        let other = NSUserDefaults.standardUserDefaults()
//        //other.removeObjectForKey("selectedLocation")
//        if (other.objectForKey("selectedLocation") as? [String]) != nil {
//            var loc = other.objectForKey("selectedLocation") as! [String]
//            if !loc.contains(currentCollege.stateAbbrev) {
//                loc.append(currentCollege.stateAbbrev)
//            }
//            other.setObject(loc, forKey: "selectedLocation")
//        } else {
//            if !selectedLocation.contains(currentCollege.stateAbbrev) {
//                selectedLocation.append(currentCollege.stateAbbrev)
//            }
//            other.setObject(selectedLocation, forKey: "selectedLocation")
//        }
//        
//        let otherDefault = other.objectForKey("selectedLocation") as! [String]
//        print("lol", otherDefault)
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mapSegue" {
            let destinationVC = segue.destinationViewController as! CollegeMapViewController
            destinationVC.college = currentCollege
        }
        
        if segue.identifier == "selectedCollege" {
            let destinationVC = segue.destinationViewController as! MyListTableViewController
            destinationVC.college = currentCollege
            //destinationVC.array = otherArray
            
            //print("willson" ,destinationVC.college)
        }
    }
    
    
    
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
