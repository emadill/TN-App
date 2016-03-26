//
//  PainHistory+CoreDataProperties.swift
//  TN App
//
//  Created by Evan Madill on 3/26/16.
//  Copyright © 2016 Evan Madill. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension PainHistory {

    @NSManaged var entryID_CD: NSNumber?
    @NSManaged var painScore_CD: NSNumber?
    @NSManaged var timestamp_CD: String?
    @NSManaged var earPain_CD: NSNumber?
    @NSManaged var jawPain_CD: NSNumber?
    @NSManaged var cheekPain_CD: NSNumber?

}
