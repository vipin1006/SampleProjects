//
//  CustomCell.swift
//  CoreDataSingleEntity
//
//  Created by ajaybabu singineedi on 26/10/15.
//  Copyright © 2015 ajaybabu singineedi. All rights reserved.
//

import Cocoa

class CustomCell: NSTableCellView {
    
    @IBOutlet weak var name:NSTextField!

    @IBOutlet weak var phone:NSTextField!
    
    @IBOutlet weak var Cimage:NSImageView!
    
    @IBOutlet weak var info:NSButton!
    
    override func drawRect(dirtyRect: NSRect) {
        
        super.drawRect(dirtyRect)

      
    }
    
}
