//
//  Model.swift
//  SourceListDynamic
//
//  Created by padalingam agasthian on 16/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class Technology: NSObject
{
    var techName : String?
    var children : [InterViewDate] = []
    
}

class InterViewDate : NSObject
{
    var interViewDate : String?
    var parent : Technology!
}
