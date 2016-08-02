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
    let inStatePrice: String
    let outStatePrice: String
    let financialAid: String
    let percentAdmitted: String
    let applicantsTotal: String
    let enrolledTotal: String
    let satCritical75: String
    let satMath75: String
    let satWriting75: String
    let actCom75: String
    let actE75: String
    let actMath75: String
    
    init(json: JSON) {
        self.name = json["Institution Name"].stringValue
        self.stateAbbrev = json["State abbreviation (HD2015)"].stringValue
        self.inStatePrice = json[ "Total price for in-state students living on campus 2015-16 (DRVIC2015)"].stringValue
        self.outStatePrice = json["Total price for out-of-state students living on campus 2015-16 (DRVIC2015)"].stringValue
        self.financialAid = json["Total number of undergraduates - financial aid cohort (SFA1314)"].stringValue
        self.percentAdmitted = json["Percent admitted - total (DRVADM2014)"].stringValue
        self.applicantsTotal = json["Applicants total (ADM2014)"].stringValue
        self.enrolledTotal = json["Enrolled total (ADM2014)"].stringValue
        self.satCritical75 = json["SAT Critical Reading 75th percentile score (ADM2014)"].stringValue
        self.satMath75 = json["SAT Math 75th percentile score (ADM2014)"].stringValue
        self.satWriting75 = json["SAT Writing 75th percentile score (ADM2014)"].stringValue
        self.actCom75 = json["ACT Composite 75th percentile score (ADM2014)"].stringValue
        self.actE75 = json["ACT English 75th percentile score (ADM2014)"].stringValue
        self.actMath75 = json["ACT Math 75th percentile score (ADM2014)"].stringValue
    }
    
}
