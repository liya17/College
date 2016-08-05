//
//  DisplayCollegeViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/1/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import SwiftyJSON

class DisplayCollegeViewController: UIViewController {

    @IBOutlet weak var currentCollegeNameLabel: UILabel!

    @IBOutlet weak var admissionRateLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var inStateLabel: UILabel!
    
    @IBOutlet weak var outStateLabel: UILabel!
    
    @IBOutlet weak var financialAidLabel: UILabel!
    
    @IBOutlet weak var totalAppLabel: UILabel!
    
    @IBOutlet weak var totalEnrolledLabel: UILabel!
    
    @IBOutlet weak var satCriticalLabel: UILabel!
    
    @IBOutlet weak var satMathLabel: UILabel!
    
    @IBOutlet weak var satWritingLabel: UILabel!
    
    @IBOutlet weak var actComLabel: UILabel!
    
    @IBOutlet weak var actEnglishLabel: UILabel!
    
    @IBOutlet weak var actMathLabel: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    var currentCollege: Colleges!
    
    var notes = [Note]()
    
    var selectedColleges: [Colleges]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let jsonURL = NSBundle.mainBundle().URLForResource("college", withExtension: "json")
            else{
                print("Could not find json!")
                return
        }
        
        let jsonData = NSData(contentsOfURL: jsonURL)!
        
        let selectedData = JSON(data:jsonData)
        
        let selectedCollegeData = selectedData.arrayValue
        
        selectedColleges = []
        
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
        
        inStateLabel.text = currentCollege.inStatePrice
        
        outStateLabel.text = currentCollege.outStatePrice
        
        financialAidLabel.text = currentCollege.financialAid
        
        //percentAdmitLabel.text = currentCollege.percentAdmitted
        
        totalAppLabel.text = currentCollege.applicantsTotal
        
        totalEnrolledLabel.text = currentCollege.enrolledTotal
        
        satCriticalLabel.text = currentCollege.satCritical75
        
        satMathLabel.text = currentCollege.satMath75
        
        satWritingLabel.text = currentCollege.satWriting75
        
        actComLabel.text = currentCollege.actCom75
        
        actEnglishLabel.text = currentCollege.actE75
        
        actMathLabel.text = currentCollege.actMath75
        
    }

    // ADD COLLEGE TO MYLIST
    @IBAction func heartButtonTapped(sender: AnyObject) {
        
        selectedColleges.append(currentCollege)
        
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
        
        if let identifier = segue.identifier {
            // 2
            if identifier == "displayNote" {
                // 3
                print("Transitioning to the Display Note View Controller")
            }
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
