//
//  DisplayCollegeViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/1/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit

class DisplayCollegeViewController: UIViewController {

    @IBOutlet weak var currentCollegeNameLabel: UILabel!
    
    @IBOutlet weak var admissionRateLabel: UILabel!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        currentCollegeNameLabel.text = currentCollege.name
        
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
