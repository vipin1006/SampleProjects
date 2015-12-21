//
//  MainWindowController.swift
//  DynamicTabView
//
//  Created by padalingam agasthian on 19/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController,NSTabViewDelegate
{

    @IBOutlet weak var tabView: NSTabView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var removeButton: NSButton!
    
    var newTabItem : NSTabViewItem?
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        removeButton.enabled = false
    }
    
    @IBAction func addAction(sender: AnyObject)
    {
        newTabItem = NSTabViewItem(identifier: "Tech Two")
        newTabItem!.label = "Tech Two"
        tabView.insertTabViewItem(newTabItem!, atIndex: 1)
        if tabView.tabViewItems.count == 4
        {
            addButton.enabled = false
            removeButton.enabled = true
        }
    }
    
    @IBAction func removeAction(sender: AnyObject)
    {
        tabView.removeTabViewItem(newTabItem!)
        if tabView.tabViewItems.count != 4
        {
            addButton.enabled = true
            removeButton.enabled = false
        }
    }
    
    func tabView(tabView: NSTabView, didSelectTabViewItem tabViewItem: NSTabViewItem?)
    {
      print(" Your selected \(tabView.selectedTabViewItem?.label) tab")
    }
}
