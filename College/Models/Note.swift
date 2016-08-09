//
//  Note.swift
//  College
//
//  Created by Liya Wu-17 on 8/7/16.
//  Copyright © 2016 ms. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    dynamic var title = ""
    dynamic var content = ""
    dynamic var college = ""
    dynamic var modificationTime = NSDate()
}
