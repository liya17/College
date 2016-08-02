//
//  CollegeMapViewController.swift
//  College
//
//  Created by Liya Wu-17 on 8/2/16.
//  Copyright © 2016 ms. All rights reserved.
//

import UIKit
import MapKit

class CollegeMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var college: Colleges!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        showOnMap()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showOnMap() {
        let geoCoder = CLGeocoder()
        var fullString = "\(college?.name) \(college?.stateAbbrev)"
        geoCoder.geocodeAddressString(fullString) { (placemarks: [CLPlacemark]?, error: NSError?) in
            if placemarks?.count > 0 {
                let topResult: CLPlacemark = placemarks![0]
                let placemark: MKPlacemark = MKPlacemark(placemark: topResult)
                var region = MKCoordinateRegion(center: (placemark.location?.coordinate)!, span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4))
                self.mapView.setRegion(region, animated: true)
                self.mapView.addAnnotation(placemark)
//                self.mapView.showAnnotations([annotation], animated: true)
//                self.mapView.selectedAnnotations(annotation, animated: true)
            }
        }
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
