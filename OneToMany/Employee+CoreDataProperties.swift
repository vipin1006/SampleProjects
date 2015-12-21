//
//  Employee+CoreDataProperties.swift
//  OneToMany
//
//  Created by padalingam agasthian on 26/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Employee
{

    @NSManaged var employeeId: String?
    @NSManaged var employeeName: String?
    @NSManaged var designation: String?
    @NSManaged var manager: NSMutableSet?
    @NSManaged var employee: Employee?

}
