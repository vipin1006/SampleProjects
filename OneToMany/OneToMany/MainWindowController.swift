//
//  MainWindowController.swift
//  OneToMany
//
//  Created by padalingam agasthian on 26/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController, PersonProtocol
{
 
    @IBOutlet var employeeList: NSArrayController!
    @IBOutlet var managerList: NSArrayController!
    @IBOutlet weak var softwareEnginnerTable: NSTableView!
    @IBOutlet weak var projectManagerTable: NSTableView!
    
    var sheetWindow : SheetWindow?
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"tableViewSelection:", name: NSTableViewSelectionIsChangingNotification, object: nil)
        self.populateData()
    }
    
    func tableViewSelection(notication:NSNotification)
    {
        
        let tableView = notication.object
        if tableView?.selectedRow != -1
        {
            let personValue = managerList.arrangedObjects[(tableView?.selectedRow)!] as? Employee
            print(personValue)
        }
    }

    
    func populateData()
    {
        managerList.content = nil
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Employee")
        let predicate = NSPredicate(format: "%K = %@", "designation", "Project Manager")
        fetchRequest.predicate = predicate
       
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            let people = results as! [Employee]
            if people.count != 0
            {
              // managedContext.deletedObjects
                print(people.dynamicType)
                managerList.addObjects(people)
            }
            else
            {
                
            }
            
        }
        catch let error as NSError
        {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }

    
    @IBAction func addEmployee(sender: AnyObject)
    {
        sheetWindow = SheetWindow(windowNibName: "SheetWindow")
        sheetWindow?.delegate = self
        self.window!.beginSheet((sheetWindow?.window)!, completionHandler: nil)
    }
    
    func callBackBy(name: String, eid: String, designation: String, reporting: String)
    {
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        let entity =  NSEntityDescription.entityForName("Employee",
            inManagedObjectContext:managedContext)
        
        let personEntity = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext) as! Employee
        if reporting == "No Reporting"
        {
            personEntity.setValue(name, forKey: "employeeName")
            personEntity.setValue(eid, forKey: "employeeId")
            personEntity.setValue(designation, forKey: "designation")
           // personEntity.setValue(NSMutableArray(), forKey: "manager")
           
        }
        else
        {
            
            let fetchRequest = NSFetchRequest(entityName: "Employee")
            
            do
            {
                let results =
                try managedContext.executeFetchRequest(fetchRequest)
                
                if results.count != 0
                {
                    for report in results
                    {
                        if let employee = report as? Employee
                        {
                            if employee.valueForKey("employeeName") as? String == reporting
                            {
                                personEntity.setValue(name, forKey: "employeeName")
                                personEntity.setValue(eid, forKey: "employeeId")
                                personEntity.setValue(designation, forKey: "designation")
                                personEntity.setValue(employee, forKey: "employee")
                                personEntity.employee = employee
                                employee.manager!.addObject(personEntity)
                            }
                        }
                        
                    }
                    
                }
                else
                {
                    
                }
                
            }
            catch let error as NSError
            {
                print("Could not fetch \(error), \(error.userInfo)")
            }

            
        }
        do
        {
            try managedContext.save()
            self.populateData()
        }
        catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
 
    }
    
}
