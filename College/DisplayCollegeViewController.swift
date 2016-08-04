//
//  DisplayCollegeViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/1/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayCollegeViewController: UIViewController {

    @IBOutlet weak var currentCollegeNameLabel: UILabel!
    
    @IBOutlet weak var admissionRateLabel: UILabel!
    
    
    
    @IBOutlet weak var heartButton: UIButton!
    
    
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var inStateLabel: UILabel!
    
    @IBOutlet weak var outStateLabel: UILabel!
    
    @IBOutlet weak var financialAidLabel: UILabel!
    
    @IBOutlet weak var percentAdmitLabel: UILabel!
    
    @IBOutlet weak var totalAppLabel: UILabel!
    
    @IBOutlet weak var totalEnrolledLabel: UILabel!
    
    @IBOutlet weak var satCriticalLabel: UILabel!
    
    @IBOutlet weak var satMathLabel: UILabel!
    
    @IBOutlet weak var satWritingLabel: UILabel!
    
    @IBOutlet weak var actComLabel: UILabel!
    
    @IBOutlet weak var actEnglishLabel: UILabel!
    
    @IBOutlet weak var actMathLabel: UILabel!
    
    var currentCollege: Colleges!
    
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = currentCollege.name
        
       //self.navigationItem.setHidesBackButton(true, animated:true);
        //self.navigationItem.backBarButtonItem setTitle:@" "
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        currentCollegeNameLabel.text = currentCollege.name
        
        // Swift
        currentCollegeNameLabel.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
        currentCollegeNameLabel.numberOfLines = 0
        
        //ADMISSION RATE
        //admissionRateLabel.text = currentCollege.admissionRate
        
        stateLabel.text = currentCollege.stateAbbrev
        
        inStateLabel.text = currentCollege.inStatePrice
        
        outStateLabel.text = currentCollege.outStatePrice
        
        financialAidLabel.text = currentCollege.financialAid
        
        percentAdmitLabel.text = currentCollege.percentAdmitted
        
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
            
                
                //FIX THIS
//                let displayNoteViewController = segue.destinationViewController as! DisplayNotesViewController
//                // 4
//                
//                let note = notes
//                
//                displayNoteViewController.note = note

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
