//
//  MainWindowController.swift
//  TableView
//
//  Created by padalingam agasthian on 10/12/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController , PersonProtocol
{
     var sheetWindow : SheetWindow?
    
    @IBOutlet weak var editButton       : NSButton!
    @IBOutlet weak var removebutton : NSButton!
    @IBOutlet var arrayController         : NSArrayController!
    @IBOutlet weak var tableView        : NSTableView!
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        removebutton.enabled = false
        editButton.enabled       = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "mySelection", name: NSTableViewSelectionDidChangeNotification, object: nil)
    }
    
    func mySelection()
    {
        if tableView.selectedRow != -1
        {
            removebutton.enabled = true
            editButton.enabled      = true
        }
        else
        {
             removebutton.enabled = false
            editButton.enabled        = false
        }
    }
    
    @IBAction func addPerson(sender: AnyObject)
    {
        sheetWindow                             = SheetWindow(windowNibName: "SheetWindow")
        sheetWindow?.personDelegate = self
        self.window?.beginSheet((sheetWindow?.window)!, completionHandler: nil)
    }
    
    @IBAction func removePerson(sender: AnyObject)
    {
       arrayController.removeObjectAtArrangedObjectIndex(tableView .selectedRow)
        removebutton.enabled = false
        editButton.enabled       = false
    }
    
    @IBAction func editPerson(sender: AnyObject)
    {
        let person : Person!                    = arrayController.arrangedObjects[tableView.selectedRow] as! Person
        sheetWindow                              = SheetWindow(windowNibName: "SheetWindow")
        sheetWindow?.personDelegate  = self
        sheetWindow?.person                = person
        self.window?.beginSheet((sheetWindow?.window)!, completionHandler: nil)
    }
    
    // delegate methods
    func callBack(personArray personArray: Person)
    {
      arrayController.addObject(personArray)
    }
    
     // delegate methods
    func editPerson(person person: Person)
    {
        let selectedRow = tableView.selectedRow
        arrayController.removeObjectAtArrangedObjectIndex(tableView .selectedRow)
        arrayController.insertObject(person, atArrangedObjectIndex: selectedRow)
    }
}
