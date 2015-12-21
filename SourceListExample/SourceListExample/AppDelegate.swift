//
//  AppDelegate.swift
//  SourceListExample
//
//  Created by padalingam agasthian on 14/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate ,NSOutlineViewDataSource, NSOutlineViewDelegate
{

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var outLine: NSOutlineView!
    @IBOutlet weak var emailIdTextField: NSTextField!
    @IBOutlet weak var lastNameTextField: NSTextField!
    @IBOutlet weak var firstNameTextField: NSTextField!
    
    var departmentOne = Department (name:"cocoa",icon:NSImage (named: "NSBonjour"))
    var departmentTwo = Department (name:"Java",icon:NSImage (named: "NSBonjour"))
  
    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        let accountOne = Account(name:"AccountOne",icon:NSImage (named: "NSBluetoothTemplate"))
        let employee10 = Employee (firstName: "Sai", lastName: "Prasad", icon: NSImage (named: "NSFolder"), email: "sai@gmail.com")
        let employee11 = Employee (firstName: "Sudhanshu", lastName: "S", icon: NSImage (named: "NSFolder"), email: "sudhanshu@gmail.com")
        accountOne.employees.append(employee10)
        accountOne.employees.append(employee11)
        
        let accountTwo = Account(name:"AccountTwo",icon:NSImage (named: "NSBluetoothTemplate"))
        let employee20 = Employee (firstName: "Vineet", lastName: "Kumar", icon: NSImage (named: "NSFolder"), email: "vineet@gmail.com")
        let employee21 = Employee (firstName: "Deva", lastName: "Raj", icon: NSImage (named: "NSFolder"), email: "deva@gmail.com")
        
        accountTwo.employees.append(employee20)
        accountTwo.employees.append(employee21)
        
        departmentOne.accounts.append(accountOne)
        departmentTwo.accounts.append(accountTwo)
        
      //  self.outLine?.expandItem(nil, expandChildren: true)
        self.outLine.reloadData()
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
        
    }
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject
    {
        if let item: AnyObject = item
        {
            switch item
            {
            case let department as Department:
                return department.accounts[index]
            case let account as Account:
                return account.employees[index]
            default:
                return self
            }
        }
        else
        {
            switch index
            {
            case 0:
                return departmentOne
            default:
                return departmentTwo
            }
        }
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool
    {
        switch item
        {
        case let department as Department:
            return (department.accounts.count > 0) ? true : false
        case let account as Account:
            return (account.employees.count > 0) ? true : false
        default:
            return false
        }
    }
    
    func outlineView(outlineView: NSOutlineView, numberOfChildrenOfItem item: AnyObject?) -> Int
    {
        if let item: AnyObject = item
        {
            switch item
            {
            case let department as Department:
                return department.accounts.count
            case let account as Account:
                return account.employees.count
            default:
                return 0
            }
        }
        else
        {
            return 2 //Department1 , Department 2
        }
    }
    
    
    // NSOutlineViewDelegate
    func outlineView(outlineView: NSOutlineView, viewForTableColumn: NSTableColumn?, item: AnyObject) -> NSView?
    {
        switch item
        {
        case let department as Department:
            let view = outlineView.makeViewWithIdentifier("HeaderCell", owner: self) as! NSTableCellView
            if let textField = view.textField
            {
                textField.stringValue = department.name
            }
            return view
        case let account as Account:
            let view = outlineView.makeViewWithIdentifier("DataCell", owner: self) as! NSTableCellView
            if let textField = view.textField
            {
                textField.stringValue = account.name
            }
            if let image = account.icon
            {
                view.imageView!.image = image
            }
            return view
        case let employee as Employee:
            let view = outlineView.makeViewWithIdentifier("DataCell", owner: self) as! NSTableCellView
            if let textField = view.textField
            {
                textField.stringValue = employee.firstName + " " + employee.lastName
            }
            if let image = employee.icon
            {
                view.imageView!.image = image
            }
            return view
        default:
            return nil
        }
        
    }
    
    // Uncomment it to get a show/Hide in sourcelist
    
//    func outlineView(outlineView: NSOutlineView, isGroupItem item: AnyObject) -> Bool
//    {
//        switch item
//        {
//        case _ as Department:
//            return true
//        case _ as Account:
//            return true
//        default:
//            return false
//        }
//    }
    
    func outlineViewSelectionDidChange(notification: NSNotification)
    {
        let selectedIndex = notification.object?.selectedRow
        let object:AnyObject? = notification.object?.itemAtRow(selectedIndex!)
        if (object is Employee)
        {
            print("selected Object is a Employee " +  (object as! Employee).firstName);
            self.firstNameTextField?.stringValue = (object as! Employee).firstName
            self.lastNameTextField?.stringValue = (object as! Employee).lastName
            self.emailIdTextField?.stringValue = (object as! Employee).email
        }
        else
        {
            print("Do nothing on Department or Account Selection")
        }
    }
}

