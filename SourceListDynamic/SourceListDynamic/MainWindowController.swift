//
//  MainWindowController.swift
//  SourceListDynamic
//
//  Created by padalingam agasthian on 16/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController ,NSOutlineViewDataSource , NSOutlineViewDelegate
{
     var content : [Technology] = []
    
    @IBOutlet weak var outlineView: NSOutlineView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var removeButton: NSButton!
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        removeButton.enabled = false
        let techOne = Technology()
        techOne.techName = "cocoa"
        let interViewDate = InterViewDate()
        let currentDate = NSDate()
        let dateFormat = NSDateFormatter()
         let usDateFormat = NSDateFormatter.dateFormatFromTemplate("MMddyyyy", options: 0, locale: NSLocale(localeIdentifier: "en-US"))
        dateFormat.dateFormat = usDateFormat
        interViewDate.interViewDate = String(dateFormat.stringFromDate(currentDate))
        techOne.children.append(interViewDate)
       
        content.append(techOne)
        outlineView.reloadData()
    }
    
    func outlineView(outlineView: NSOutlineView, child index: Int, ofItem item: AnyObject?) -> AnyObject
    {
        if let item: AnyObject = item
        {
            switch item
            {
            case let tech as Technology:
                return tech.children[index]
            default:
                return self
            }
        }
        else
        {
            return content[index]
        }
    }
    
    func outlineView(outlineView: NSOutlineView, isItemExpandable item: AnyObject) -> Bool
    {
        switch item
        {
        case let tech as Technology:
            return (tech.children.count > 0) ? true : false
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
            case let tech as Technology:
                return tech.children.count
           
            default:
                return 0
            }
        }
        else
        {
            return content.count
        }
    }
    
    func outlineView(outlineView: NSOutlineView, viewForTableColumn: NSTableColumn?, item: AnyObject) -> NSView?
    {
        switch item
        {
        case let tech as Technology:
            let view = outlineView.makeViewWithIdentifier("HeaderCell", owner: self) as! NSTableCellView
            if let textField = view.textField
            {
                textField.stringValue = tech.techName!
            }
            return view
        case let interView as InterViewDate:
            let view = outlineView.makeViewWithIdentifier("DataCell", owner: self) as! NSTableCellView
            if let textField = view.textField
            {
                textField.stringValue = interView.interViewDate!
            }
            return view
        default:
            return nil
        }
        
    }
    
        func outlineView(outlineView: NSOutlineView, isGroupItem item: AnyObject) -> Bool
        {
            switch item
            {
            case _ as Technology:
                return true
            default:
                return false
            }
        }
    
    @IBAction func addDateOrSkill(sender: AnyObject)
    {
        removeButton.enabled = false
        if let children = outlineView.itemAtRow(outlineView.selectedRow) as? Technology
        {
           self.addParentOrChildren(children , selectParent: false)
        }
        else
        {
            self.addParentOrChildren(nil, selectParent: true)
        }

    }
    
    @IBAction func removeDateOrSkill(sender: AnyObject)
    {
        if let parent = outlineView.itemAtRow(outlineView.selectedRow) as? Technology
        {
            var count = 0
            for checkElement in content
            {
                if checkElement == parent
                {
                    content.removeAtIndex(count)
                }
                count++
            }
            outlineView.reloadData()
        }
        if let children = outlineView.itemAtRow(outlineView.selectedRow) as? InterViewDate
        {
            
            for checkElement in content
            {
                var count = 0
                for child in checkElement.children
                {
                    if children == child
                    {
                        checkElement.children.removeAtIndex(count)
                    }
                    count++
                }
            }
            outlineView.reloadData()
        }
        addButton.enabled = true
        removeButton.enabled = false
    }
    
    func removeParentOrChild()
    {
       
        
    }
    
    func addParentOrChildren(parendOfChild : Technology? ,selectParent:Bool)
    {
        if let _ = parendOfChild
        {
            for contentValue in content
            {
                if contentValue == parendOfChild
                {
                    let interViewDate = InterViewDate()
                    let currentDate = NSDate()
                    let dateFormat = NSDateFormatter()
                    let usDateFormat = NSDateFormatter.dateFormatFromTemplate("MMddyyyy", options: 0, locale: NSLocale(localeIdentifier: "en-US"))
                    dateFormat.dateFormat = usDateFormat
                    interViewDate.interViewDate = String(dateFormat.stringFromDate(currentDate))
                    contentValue.children.append(interViewDate)
                    outlineView.reloadData()
                }
            }
        }
        else
        {
        let newSkill = Technology()
        newSkill.techName = "Java"
        content.append(newSkill)
        outlineView.reloadData()
        }
    }
    
    func outlineViewSelectionDidChange(notification: NSNotification)
    {
        if let _ = outlineView.itemAtRow(outlineView.selectedRow) as? Technology
        {
            addButton.enabled = true
            removeButton.enabled = true
        }
        else
        {
            removeButton.enabled = true
            addButton.enabled = false
        }
    }
}
