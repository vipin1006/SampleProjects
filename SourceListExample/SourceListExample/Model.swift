//
//  Model.swift
//  SourceListExample
//
//  Created by padalingam agasthian on 14/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class Department: NSObject {
    let name:String
    var accounts: [Account] = []
    let icon:NSImage?
    
    init (name:String,icon:NSImage?){
        self.name = name
        self.icon = icon
    }
}

class Account: NSObject {
    let name:String
    var employees: [Employee] = []
    let icon:NSImage?
    
    init (name:String,icon:NSImage?){
        self.name = name
        self.icon = icon
    }
}

class Employee: NSObject {
    let firstName:String
    let lastName:String
    let icon:NSImage?
    let email:String
    
    init (firstName:String, lastName:String, icon:NSImage?, email:String){
        self.firstName = firstName
        self.lastName = lastName
        self.icon = icon
        self.email = email
    }
}
