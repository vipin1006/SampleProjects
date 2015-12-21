//
//  Candidate+CoreDataProperties.swift
//  CoreDataSingleEntity
//
//  Created by ajaybabu singineedi on 26/10/15.
//  Copyright © 2015 ajaybabu singineedi. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData



extension Candidate
{

    @NSManaged var firstName: String?
    @NSManaged var lastname: String?
    @NSManaged var phone: String?
    @NSManaged var email: String?
    @NSManaged var companyName: String?
    @NSManaged var experience: String?
    @NSManaged var dateOfBirth: NSDate?
    @NSManaged var photo: NSData?
    @NSManaged var passport: NSNumber?

}
