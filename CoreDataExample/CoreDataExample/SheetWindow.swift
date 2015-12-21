//
//  SheetWindow.swift
//  CoreDataExample
//
//  Created by padalingam agasthian on 15/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

protocol PersonProtocol
{
    func callBack (personArray personArray : Person)
    func editPerson(person person : Person)
}

class Person
{
    var id : Int?
    var name : String?
    var email : String?
    var dept : String?
}

class SheetWindow: NSWindowController
{
    
    @IBOutlet weak var id: NSTextField!
    @IBOutlet weak var department: NSTextField!
    @IBOutlet weak var emailId: NSTextField!
    @IBOutlet weak var name: NSTextField!
  
    var delegate : PersonProtocol?
    var person : Person?
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        if let personValue = person
        {
            id.integerValue = personValue.id!
            name.stringValue = personValue.name!
            emailId.stringValue = personValue.email!
            department.stringValue = personValue.dept!
            id.editable = false
        }

    }
    
    @IBAction func cancel(sender: AnyObject)
    {
        self.window?.sheetParent?.endSheet(self.window!)
    }
    
    @IBAction func save(sender: AnyObject)
    {
        if let _ = person
        {
            let person = Person()
            person.id = id.integerValue
            person.name = name.stringValue
            person.email = emailId.stringValue
            person.dept = department.stringValue
            delegate?.editPerson(person: person)
            self.window?.sheetParent?.endSheet(self.window!)
        }
        else
        {
            let person = Person()
            person.id = id.integerValue
            person.name = name.stringValue
            person.email = emailId.stringValue
            person.dept = department.stringValue
            delegate?.callBack(personArray: person)
            self.window?.sheetParent?.endSheet(self.window!)
        }
    }
}
