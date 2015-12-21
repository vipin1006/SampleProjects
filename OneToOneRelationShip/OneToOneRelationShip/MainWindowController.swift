//
//  MainWindowController.swift
//  OneToOneRelationShip
//
//  Created by padalingam agasthian on 21/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController,PersonProtocol
{

    var sheetWindow : SheetWindow?
    weak var appdelegate : AppDelegate?
    @IBOutlet var personList: NSArrayController!
    @IBOutlet weak var issuedDate: NSTextField!
    @IBOutlet weak var passportNo: NSTextField!
    @IBOutlet weak var issuedPlace: NSTextField!
    @IBOutlet weak var expiryDate: NSTextField!

    
    dynamic var flag = false
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        appdelegate = AppDelegate()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"tableViewSelection:", name: NSTableViewSelectionIsChangingNotification, object: nil)
        self.populateData()
    }
    
    func tableViewSelection(notication:NSNotification)
    {
        
       let tableView = notication.object
        if tableView?.selectedRow != -1
        {
        let personValue = personList.arrangedObjects[(tableView?.selectedRow)!] as? NSManagedObject
        let passportValue = personValue?.valueForKey("passport") as? NSManagedObject
        passportNo.stringValue = (passportValue?.valueForKey("passportNo") as? String)!
        issuedDate.stringValue = (passportValue?.valueForKey("issueDate") as? String)!
        issuedPlace.stringValue = (passportValue?.valueForKey("issuedPlace") as? String)!
        expiryDate.stringValue = (passportValue?.valueForKey("expiryDate") as? String)!
        }
    }
    
    @IBAction func saveAction(sender: AnyObject)
    {
        flag = true
        sheetWindow = SheetWindow(windowNibName: "SheetWindow")
        sheetWindow?.delegate = self
        self.window!.beginSheet((sheetWindow?.window)!, completionHandler: nil)
    }
    
    func callBackBy(person person: Person, passport: Passport)
    {
        
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        let entity =  NSEntityDescription.entityForName("Person",
            inManagedObjectContext:managedContext)
        
        let personEntity = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        personEntity.setValue(person.personName, forKey: "name")
        personEntity.setValue(person.email, forKey: "email")
        personEntity.setValue(person.designation, forKey: "designation")
        personEntity.setValue(person.phoneNo, forKey: "phoneNo")
       
        
        let passportEntity =  NSEntityDescription.entityForName("Passport",
            inManagedObjectContext:managedContext)
        
        let passportMO = NSManagedObject(entity: passportEntity!,
            insertIntoManagedObjectContext: managedContext)
        
        passportMO.setValue(passport.passportNo, forKey: "passportNo")
        passportMO.setValue(passport.issuedPlace, forKey: "issuedPlace")
        passportMO.setValue(passport.issuedDate, forKey: "issueDate")
        passportMO.setValue(passport.expiryDate, forKey: "expiryDate")
        passportMO.setValue(personEntity, forKey: "person")
        personEntity.setValue(passportMO, forKey: "passport")
        do
        {
            try managedContext.save()
        }
        catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
        self.populateData()
    }
    
    func populateData()
    {
        personList.content = nil
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            let people = results as! [NSManagedObject]
            if people.count != 0
            {
                personList.addObjects(people)
            }
            else
            {
//                remove.enabled = false
//                edit.enabled   = false
            }
            
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

}
