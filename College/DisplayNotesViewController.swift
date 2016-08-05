//
//  DisplayNotesViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/2/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import RealmSwift

class DisplayNotesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let displayCollegeViewController = segue.destinationViewController as! DisplayCollegeViewController

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // We are using the optional binding technique to unwrap the value in the note property and storing the actual value (if it exists) in a local variable

    }
    
}

