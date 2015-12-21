//
//  MainWindowController.swift
//  DynamicViewAdd
//
//  Created by padalingam agasthian on 20/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController
{
    @IBOutlet weak var box: NSBox!
    @IBOutlet weak var removeButton: NSButton!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var firstView: NSView!
    @IBOutlet weak var secondView: NSView!
    @IBOutlet weak var thirdView: NSView!
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        firstView.wantsLayer = true
        secondView.wantsLayer = true
        thirdView.wantsLayer = true
        firstView.layer?.backgroundColor = NSColor.blackColor().CGColor
        secondView.layer?.backgroundColor = NSColor.blueColor().CGColor
        thirdView.layer?.backgroundColor = NSColor.orangeColor().CGColor
       
    }
        @IBAction func addAction(sender: AnyObject)
    {
        let view = box.subviews[0]
        self.addView(subviewCount: view.subviews.count)
    
    }
    
    @IBAction func removeAction(sender: AnyObject)
    {
        
    }
    
    func addView(subviewCount subViewCount : Int)
    {
        
    }
    
}
