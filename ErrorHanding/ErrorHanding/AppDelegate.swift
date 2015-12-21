//
//  AppDelegate.swift
//  ErrorHanding
//
//  Created by padalingam agasthian on 19/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{

    @IBOutlet weak var window: NSWindow!
    var mainWindowController :MainWindowController?
    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        // Insert code here to initialize your application
        mainWindowController = MainWindowController(windowNibName: "MainWindowController")
        mainWindowController?.showWindow(self)
        self.window.close()
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }


}

