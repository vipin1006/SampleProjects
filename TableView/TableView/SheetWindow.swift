//
//  SheetWindow.swift
//  TableView
//
//  Created by padalingam agasthian on 10/12/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class SheetWindow: NSWindowController
{
    var personDelegate : PersonProtocol?
    var person               :  Person?
    
    @IBOutlet weak var personName: NSTextField!
    @IBOutlet weak var department  :  NSTextField!
    @IBOutlet weak var email            :  NSTextField!
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        if let personValue = person
        {
            print("\(personValue.personName)")
            personName.stringValue = personValue.personName!
            email.stringValue             = personValue.email!
            department.stringValue   = personValue.department!
        }
    }
    
    @IBAction func save(sender: AnyObject)
    {
        if let _ = person
        {
            let person                  = Person()
            person.personName = personName.stringValue;
            person.email             = email.stringValue
            person.department   = department.stringValue
            personDelegate?.editPerson(person: person)
            self.window?.sheetParent?.endSheet(self.window!)
        }
        else
        {
            let person                  = Person()
            person.personName = personName.stringValue;
            person.email             = email.stringValue
            person.department   = department.stringValue
            personDelegate?.callBack(personArray: person)
            self.window?.sheetParent?.endSheet(self.window!)
        }
       
    }
    
    @IBAction func cancel(sender: AnyObject)
    {
        self.window?.sheetParent?.endSheet(self.window!)
    }
}
