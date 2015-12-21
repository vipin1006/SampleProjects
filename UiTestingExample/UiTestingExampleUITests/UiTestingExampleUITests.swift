//
//  UiTestingExampleUITests.swift
//  UiTestingExampleUITests
//
//  Created by padalingam agasthian on 21/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import XCTest

class UiTestingExampleUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample()
    {
        
    }
    
    func testSaveAction()
    {
        
        let uitestingexampleWindow = XCUIApplication().windows["UiTestingExample"]
        uitestingexampleWindow.click()
        
        let saveGroupsQuery = uitestingexampleWindow.groups.containingType(.Button, identifier:"Save")
        let textField = saveGroupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(0)
        textField.click()
        textField.typeText("12\t")
        saveGroupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(3).typeText("sai\t")
        saveGroupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(1).typeText("sai@gmail.com\t")
        saveGroupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(2).typeText("2")
        uitestingexampleWindow.buttons["Save"].click()
        
        
    }
    
    func testCancelAction()
    {
        
        let uitestingexampleWindow = XCUIApplication().windows["UiTestingExample"]
        let saveGroupsQuery = uitestingexampleWindow.groups.containingType(.Button, identifier:"Save")
        saveGroupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(0).typeText("12\t")
        saveGroupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(3).typeText("sai\t")
        saveGroupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(1).typeText("sai@gmail.com\t")
        saveGroupsQuery.childrenMatchingType(.TextField).elementBoundByIndex(2).typeText("3")
        uitestingexampleWindow.buttons["Cancel"].click()
        
    }
    
}
