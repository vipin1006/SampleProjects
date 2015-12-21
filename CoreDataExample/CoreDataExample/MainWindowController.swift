//
//  MainWindowController.swift
//  CoreDataExample
//
//  Created by padalingam agasthian on 10/13/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController,PersonProtocol
{
   
    var sheetWindow : SheetWindow?
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet var personList: NSArrayController!
    @IBOutlet weak var edit: NSButton!
    @IBOutlet weak var remove: NSButton!
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        remove.enabled = false
        edit.enabled   = false
         NSNotificationCenter.defaultCenter().addObserver(self, selector: "mySelection", name: NSTableViewSelectionDidChangeNotification, object: nil)
        self.populateData()
    }
    
    func mySelection()
    {
        if tableView.selectedRow != -1
        {
            remove.enabled = true
            edit.enabled   = true
        }
        else
        {
            remove.enabled = false
            edit.enabled   = false
        }
    }
    
    @IBAction func add(sender: AnyObject)
    {
         sheetWindow = SheetWindow(windowNibName: "SheetWindow")
        sheetWindow?.delegate = self
        self.window?.beginSheet(sheetWindow!.window!, completionHandler: nil)
    }
    
    @IBAction func edit(sender: AnyObject)
    {
        let personValue : NSManagedObject! = personList.arrangedObjects[tableView.selectedRow] as! NSManagedObject
        sheetWindow                              = SheetWindow(windowNibName: "SheetWindow")
        sheetWindow?.delegate = self
        sheetWindow?.person = Person()
        sheetWindow?.person!.id = personValue.valueForKey("id") as? Int
        sheetWindow?.person!.name = personValue.valueForKey("name") as? String
        sheetWindow?.person!.email = personValue.valueForKey("email") as? String
        sheetWindow?.person!.dept = personValue.valueForKey("dept") as? String
        self.window?.beginSheet((sheetWindow?.window)!, completionHandler: nil)
    }
    
    @IBAction func remove(sender: AnyObject)
    {
        let personValue : NSManagedObject! = personList.arrangedObjects[tableView.selectedRow] as! NSManagedObject
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Person")
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            let people = results as! [NSManagedObject]
            
            for person in people
            {
                if person.valueForKey("id") as? Int == personValue.valueForKey("id") as? Int
                {
                   managedContext.deleteObject(person)
                   try managedContext.save()
                }
                self.populateData()
            }
           
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    func callBack(personArray personArray: Person)
    {
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        let entity =  NSEntityDescription.entityForName("Person",
            inManagedObjectContext:managedContext)
        
        let person = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        person.setValue(personArray.name, forKey: "name")
        person.setValue(personArray.id, forKey: "id")
        person.setValue(personArray.email, forKey: "email")
        person.setValue(personArray.dept, forKey: "dept")
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
    
    func editPerson(person person : Person)
     {
        remove.enabled = false
        edit.enabled   = false
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Person")
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            let people = results as! [NSManagedObject]
            
            for personValue in people
            {
                if personValue.valueForKey("id") as? Int == person.id
                {
                    personValue.setValue(person.name, forKey: "name")
                    personValue.setValue(person.id, forKey: "id")
                    personValue.setValue(person.email, forKey: "email")
                    personValue.setValue(person.dept, forKey: "dept")
                    try managedContext.save()
                }
                self.populateData()
            }
            
        } catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
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
                remove.enabled = false
                edit.enabled   = false
            }
            
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
}
