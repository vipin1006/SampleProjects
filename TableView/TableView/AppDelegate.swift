//
//  AppDelegate.swift
//  TableView
//
//  Created by padalingam agasthian on 10/12/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa
//import MainWindowController

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate
{
    var mainWindowController : MainWindowController?
    
    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        mainWindowController =  MainWindowController(windowNibName:  "MainWindowController")
        mainWindowController?.showWindow(self)
        self.window.close()
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
       
    }
}

