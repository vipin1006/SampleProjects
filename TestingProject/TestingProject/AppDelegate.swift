//
//  AppDelegate.swift
//  TestingProject
//
//  Created by padalingam agasthian on 10/8/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate
{

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        let initialDate = NSDate()
        
        let components = NSDateComponents()
        components.year = 1
        components.month = 5
        components.minute = 42
        
        let laterDate = NSCalendar.currentCalendar().dateByAddingComponents(components, toDate: initialDate, options: .MatchStrictly)!
        
        
        //This will call the overloaded method
        let difference = laterDate - initialDate
        
        print(difference.month)
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }


}

func - (left: NSDate, right: NSDate) -> NSDateComponents
{
    let mostUnits: NSCalendarUnit = .Month
    let components = NSCalendar.currentCalendar().components(mostUnits, fromDate: right, toDate: left, options: .MatchStrictly)
    return components
}
