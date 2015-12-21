//
//  MainWindowController.swift
//  MasterDetail
//
//  Created by padalingam agasthian on 10/13/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController
{
    @IBOutlet var employeeList: NSArrayController!
    
    override func windowDidLoad()
    {
        super.windowDidLoad()
        
        
        let employeeOne = Employee()
        employeeOne.employeeName = "Kumar"
        
        let empOneOfficeAddress = Address()
        empOneOfficeAddress.address =  "Kumar Office Address"
        
        let empOneOfficeDetails = AddressDetails()
        empOneOfficeDetails.street = "Mission Road"
        empOneOfficeDetails.pinCode = "560025"
        empOneOfficeDetails.city = "Bangalore"
        empOneOfficeAddress.addressDetails?.append(empOneOfficeDetails)
    
        let empOneTempAddress = Address()
        empOneTempAddress.address =  "Kumar Temp Address"
        
        let empOneTempDetails = AddressDetails()
        empOneTempDetails.street = "6th Main, Madivala"
        empOneTempDetails.pinCode = "560078"
        empOneTempDetails.city = "Bangalore"
        
        empOneTempAddress.addressDetails?.append(empOneTempDetails)
       
        employeeOne.address?.append(empOneOfficeAddress)
        employeeOne.address?.append(empOneTempAddress)
        
        let employeeTwo = Employee()
        employeeTwo.employeeName = "Ram"
        
        let empTwoOfficeAddress = Address()
        empTwoOfficeAddress.address =  "Ram Office Address"
        
        let empTwoOfficeDetails = AddressDetails()
        empTwoOfficeDetails.street = "Richmond Circle"
        empTwoOfficeDetails.pinCode = "560054"
        empTwoOfficeDetails.city = "Bangallore"
        empTwoOfficeAddress.addressDetails?.append(empTwoOfficeDetails)

        employeeTwo.address?.append(empTwoOfficeAddress)
        
        print(_stdlib_getDemangledTypeName(empTwoOfficeDetails))
        print(_stdlib_getDemangledTypeName(empTwoOfficeAddress))
        
        let empTwoTempAddress = Address()
        empTwoTempAddress.address =  "Ram Temp Address"
        
        let empTwoTempDetails = AddressDetails()
        empTwoTempDetails.street = "8th Main"
        empTwoTempDetails.pinCode = "660078"
        empTwoTempDetails.city = "Andra"
        
        empTwoTempAddress.addressDetails?.append(empTwoTempDetails)

        employeeTwo.address?.append(empTwoTempAddress)
        
        employeeList.addObject(employeeOne)
        employeeList.addObject(employeeTwo)
        employeeList.setSelectionIndex(0)
    }
    
}
