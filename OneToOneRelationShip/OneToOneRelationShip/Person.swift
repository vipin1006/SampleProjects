//
//  Person.swift
//  OneToOneRelationShip
//
//  Created by padalingam agasthian on 21/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class Person: NSObject
{
    var personName : String?
    var email : String?
    var designation : String?
    var phoneNo : String?
    var passport : Passport?
}

class Passport : NSObject
{
    var passportNo : String?
    var issuedDate : String?
    var expiryDate : String?
    var issuedPlace : String?
    var person : Person?
}
