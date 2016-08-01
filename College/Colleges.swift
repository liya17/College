//
//  Colleges.swift
//  College
//
//  Created by Liya Wu-17 on 7/31/16.
//  Copyright © 2016 ms. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Colleges {
    let name: String
    let stateAbbrev: String
    let inStatePrice: Double
    let outStatePrice: Double
    let financialAid: Int
    let percentAdmitted: Int
    let applicantsTotal: Int
    let enrolledTotal: Int
    let satCritical75: Int
    let satMath75: Int
    let writing75: Int
    let actCom75: Int
    let actE75: Int
    let actMath75: Int
    
    init(json: JSON) {
        self.name = json["Institution Name"].stringValue
        self.stateAbbrev = json["State abbreviation (HD2015)"].stringValue
        self.inStatePrice = json[ "Total price for in-state students living on campus 2015-16 (DRVIC2015)"].doubleValue
        self.outStatePrice = json["Total price for out-of-state students living on campus 2015-16 (DRVIC2015)"].doubleValue
        self.financialAid = json["Total number of undergraduates - financial aid cohort (SFA1314)"].intValue
         self.percentAdmitted = json["Percent admitted - total (DRVADM2014)"].intValue
        self.applicantsTotal = json["Applicants total (ADM2014)"].intValue
        self.enrolledTotal = json["Enrolled total (ADM2014)"].intValue
        self.satCritical75 = json["SAT Critical Reading 75th percentile score (ADM2014)"].intValue
        self.satMath75 = json["SAT Math 75th percentile score (ADM2014)"].intValue
        self.writing75 = json["SAT Writing 75th percentile score (ADM2014)"].intValue
        self.actCom75 = json["ACT Composite 75th percentile score (ADM2014)"].intValue
        self.actE75 = json["ACT English 75th percentile score (ADM2014)"].intValue
        self.actMath75 = json["ACT Math 75th percentile score (ADM2014)"].intValue
    }
    
}
