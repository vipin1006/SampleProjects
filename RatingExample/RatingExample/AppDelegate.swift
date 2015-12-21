//
//  AppDelegate.swift
//  RatingExample
//
//  Created by padalingam agasthian on 15/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate
{
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var rating: NSTextField!
    @IBOutlet weak var first: NSButton!
    @IBOutlet weak var second: NSButton!
    @IBOutlet weak var three: NSButton!
    @IBOutlet weak var five: NSButton!
    @IBOutlet weak var four: NSButton!
    
    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
       
    }

    @IBAction func firstStar(sender: AnyObject)
    {
        let clicked : NSButton = sender as! NSButton
        if clicked.state == 1
        {
            first.image = NSImage(named: "starhighlighted.png")
            rating.stringValue = "Not-Satisfactory"
            rating.textColor = NSColor.redColor()
        }
        else
        {
            second.state = Int(0)
            three.state = Int(0)
            four.state = Int(0)
            five.state = Int(0)
            first.image = NSImage(named: "star.png")
            second.image = NSImage(named: "star.png")
            three.image = NSImage(named: "star.png")
            four.image = NSImage(named: "star.png")
            five.image = NSImage(named: "star.png")
            rating.stringValue = ""
            rating.textColor = NSColor.redColor()
        }
        
    }
   
    @IBAction func secondStar(sender: AnyObject)
    {
        let clicked : NSButton = sender as! NSButton
        if clicked.state == 1
        {
            first.state = Int(1)
            first.image = NSImage(named: "starhighlighted.png")
            second.image = NSImage(named: "starhighlighted.png")
            rating.stringValue = "Satisfactory"
            rating.textColor = NSColor.orangeColor()
        }
        else
        {
            three.state = Int(0)
            four.state = Int(0)
            five.state = Int(0)
            second.image = NSImage(named: "star.png")
            three.image = NSImage(named: "star.png")
            four.image = NSImage(named: "star.png")
            five.image = NSImage(named: "star.png")
            rating.stringValue = "Not-Satisfactory"
            rating.textColor = NSColor.redColor()
        }
        
    }
    @IBAction func thirdStar(sender: AnyObject)
    {
        let clicked : NSButton = sender as! NSButton
        if clicked.state == 1
        {
            first.state = Int(1)
            second.state = Int(1)
            first.image = NSImage(named: "starhighlighted.png")
            second.image = NSImage(named: "starhighlighted.png")
            three.image = NSImage(named: "starhighlighted.png")
            rating.stringValue = "Good"
            rating.textColor = NSColor.brownColor()
        }
        else
        {
            four.state = Int(0)
            five.state = Int(0)
           
            three.image = NSImage(named: "star.png")
            four.image = NSImage(named: "star.png")
            five.image = NSImage(named: "star.png")
            rating.stringValue = "Satisfactory"
            rating.textColor = NSColor.orangeColor()
        }
    }
   
    @IBAction func fourthStar(sender: AnyObject)
    {
        let clicked : NSButton = sender as! NSButton
        if clicked.state == 1
        {
            first.state = Int(1)
            second.state = Int(1)
            three.state = Int(1)
            rating.stringValue = "Very Good"
            rating.textColor = NSColor.blueColor()
            first.image = NSImage(named: "starhighlighted.png")
            second.image = NSImage(named: "starhighlighted.png")
            three.image = NSImage(named: "starhighlighted.png")
            four.image = NSImage(named: "starhighlighted.png")
        }
        else
        {
            five.state = Int(0)
            four.image = NSImage(named: "star.png")
            five.image = NSImage(named: "star.png")
            rating.stringValue = "Good"
            rating.textColor = NSColor.brownColor()
        }
    }
    
    @IBAction func fifthStar(sender: AnyObject)
    {
        let clicked : NSButton = sender as! NSButton
        if clicked.state == 1
        {
            first.state = Int(1)
            second.state = Int(1)
            three.state = Int(1)
            four.state = Int(1)
            rating.textColor = NSColor.greenColor()
            rating.stringValue = "Excellent"
            first.image = NSImage(named: "starhighlighted.png")
            second.image = NSImage(named: "starhighlighted.png")
            three.image = NSImage(named: "starhighlighted.png")
            four.image = NSImage(named: "starhighlighted.png")
            five.image = NSImage(named: "starhighlighted.png")
        }
        else
        {
            five.image = NSImage(named: "star.png")
            rating.textColor = NSColor.blueColor()
            rating.stringValue = "Very Good"
        }
    }
}

