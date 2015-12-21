//
//  SheetWindow.swift
//  OneToMany
//
//  Created by padalingam agasthian on 26/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class SheetWindow: NSWindowController
{
    @IBOutlet weak var employeeName: NSTextField!
    @IBOutlet weak var reporting: NSPopUpButton!
    @IBOutlet weak var designation: NSPopUpButton!
    @IBOutlet weak var employeeId: NSTextField!
    
    var delegate : PersonProtocol?
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Employee")
        let predicate = NSPredicate(format: "%K = %@", "designation", "Project Manager")
        fetchRequest.predicate = predicate
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            if results.count != 0
            {
                for report in results
                {
                    if let employee = report as? NSManagedObject
                    {
                       reporting.addItemWithTitle((employee.valueForKey("employeeName") as? String)!)
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
        catch
        {
            
        }
    }
    
    @IBAction func save(sender: AnyObject)
    {
        delegate?.callBackBy(employeeName.stringValue, eid: employeeId.stringValue, designation: designation.title, reporting: reporting.title)
         self.window?.sheetParent?.endSheet(self.window!)
    }
    
    @IBAction func cancel(sender: AnyObject)
    {
         self.window?.sheetParent?.endSheet(self.window!)
    }
}
