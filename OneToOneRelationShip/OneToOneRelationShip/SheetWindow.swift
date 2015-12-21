//
//  SheetWindow.swift
//  OneToOneRelationShip
//
//  Created by padalingam agasthian on 21/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class SheetWindow: NSWindowController
{
    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var phoneNo: NSTextField!
    @IBOutlet weak var email: NSTextField!
    @IBOutlet weak var designation: NSPopUpButton!
    @IBOutlet weak var expiryDate: NSDatePicker!
    @IBOutlet weak var issueDate: NSDatePicker!
    @IBOutlet weak var passportNo: NSTextField!
    @IBOutlet weak var issuedPlace: NSTextField!
    
    var delegate : PersonProtocol?
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
    }
    
    @IBAction func add(sender: AnyObject)
    {
        let person = Person()
        person.email = email.stringValue
        person.personName = name.stringValue
        person.designation = designation.title
        person.phoneNo = phoneNo.stringValue
        let passport = Passport()
        passport.passportNo = passportNo.stringValue
        passport.issuedDate = issueDate.stringValue
        passport.expiryDate = expiryDate.stringValue
        passport.issuedPlace = issuedPlace.stringValue
        passport.person = person
        person.passport = passport
        delegate?.callBackBy(person: person, passport: passport)
        self.window?.sheetParent?.endSheet(self.window!)
    }
    
    @IBAction func cancel(sender: AnyObject)
    {
        self.window?.sheetParent?.endSheet(self.window!)
    }
    
}
