//
//  AppDelegate.swift
//  UiTestingExample
//
//  Created by padalingam agasthian on 21/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var id: NSTextField!
    @IBOutlet weak var name: NSTextField!
    @IBOutlet weak var emailId: NSTextField!
    @IBOutlet weak var exp: NSTextField!

    @IBOutlet weak var eName: NSTextField!
    @IBOutlet weak var eId: NSTextField!
    @IBOutlet weak var eExp: NSTextField!
    @IBOutlet weak var eEmail: NSTextField!
    
    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }
    
    @IBAction func saveAction(sender: AnyObject)
    {
       eName.stringValue = name.stringValue
        eId.stringValue = id.stringValue
        eExp.stringValue = exp.stringValue
        eEmail.stringValue = emailId.stringValue
    }

    @IBAction func cancelAction(sender: AnyObject)
    {
        name.stringValue = ""
        id.stringValue = ""
        exp.stringValue = ""
        emailId.stringValue = ""
        eName.stringValue = ""
        eId.stringValue = ""
        eExp.stringValue = ""
        eEmail.stringValue = ""
    }

}

