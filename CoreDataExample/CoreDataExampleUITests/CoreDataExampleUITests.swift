//
//  CoreDataExampleUITests.swift
//  CoreDataExampleUITests
//
//  Created by padalingam agasthian on 10/13/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import XCTest

class CoreDataExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        if #available(OSX 10.11, *) {
            XCUIApplication().launch()
        } else {
            // Fallback on earlier versions
        }

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample()
    {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        if #available(OSX 10.11, *)
        {
            let window = XCUIApplication().windows["Window"]
            window.buttons["Add"].click()
            
            let sheetsQuery = window.sheets
            let groupsQuery = sheetsQuery.groups
            groupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(0).typeText("12\t")
            groupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(3).typeText("padalingam\t")
            groupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(1).typeText("pada@gmail.com\t")
            groupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(2).typeText("cocoa")
            sheetsQuery.buttons["Save"].click()

        } else
        {
            // Fallback on earlier versions
        }
    }
    
}
