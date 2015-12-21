//
//  EntityControllerClass.swift
//  CoreDataSingleEntity
//
//  Created by ajaybabu singineedi on 26/10/15.
//  Copyright © 2015 ajaybabu singineedi. All rights reserved.
//

import Cocoa
import Quartz
import CoreData

class EntityControllerClass: NSObject,NSTableViewDataSource,NSTableViewDelegate,NSTextFieldDelegate{
    
    //MARK: UI Properties
    
    @IBOutlet weak var firstNameField: NSTextField!
    @IBOutlet weak var lastNameField: NSTextField!
    @IBOutlet weak var myTableView: NSTableView!
    @IBOutlet weak var phoneField: NSTextField!
    @IBOutlet weak var emailField: NSTextField!
    @IBOutlet weak var companyField: NSTextField!
    @IBOutlet weak var experienceField: NSTextField!
    @IBOutlet weak var dateField: NSDatePicker!
    @IBOutlet weak var passportField: NSButton!
    
    //MARK: Modal Properties
    
    var appDel:AppDelegate?=nil
    var image:NSImage? = nil
    var candidates:NSMutableArray = NSMutableArray()

    

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        loadData()
}

    //MARK: IBAction Implementaions
    
    @IBAction func saveDetails(sender: AnyObject)
    {
        
        if validation() {
        
        if let appDel = NSApplication.sharedApplication().delegate as? AppDelegate {
            
            let moc = appDel.managedObjectContext as NSManagedObjectContext
            
            let entity:NSEntityDescription = NSEntityDescription.entityForName("Candidate", inManagedObjectContext: moc)!
            
           let candidate:Candidate = Candidate(entity:entity, insertIntoManagedObjectContext:moc) as Candidate
            
            candidate.firstName = self.firstNameField.stringValue
            
            candidate.lastname = self.lastNameField.stringValue
            
            candidate.email = self.lastNameField.stringValue
            
            candidate.phone = self.phoneField.stringValue
            
            candidate.dateOfBirth = self.dateField.dateValue
            
            candidate.companyName = self.companyField.stringValue
            
            candidate.experience = self.experienceField.stringValue
            
            if self.passportField.stringValue == "0"{
            
            candidate.passport = false
            
            }else{
                
                candidate.passport = true
            }
            
            if let x = image{
              
                let cgref:CGImageRef = x.CGImageForProposedRect(nil, context: nil, hints: nil)!
                
                let bitMapt:NSBitmapImageRep = NSBitmapImageRep(CGImage:cgref)
                
                let imageData = bitMapt.representationUsingType(.NSPNGFileType, properties:["pixelsWide":"200","pixelsHigh":"200"])
                
                candidate.photo = imageData
            }
            
            do{
                try candidate.managedObjectContext?.save()
                
                print("Record Succesfully Savaed")
                
                
            }catch{
                
                print("Problem Occured while Saving")
            }
            
            loadData()
            
            self.myTableView.reloadData()
            
            clearAll()
            
}
            
        }
        
}


    @IBAction func cancel(sender: AnyObject) {
        
        clearAll()
    }
    
    @IBAction func deleteRecords(sender: AnyObject) {
        
        if self.myTableView.selectedRow == -1{
            
            showAlert("No Candidate selected", infor:"Please select a Candidate before deleting")
            
            
        }else{
            
            
            let a = candidates[self.myTableView.selectedRow] as! Candidate
            
            
            let moc = appDel?.managedObjectContext
            
            moc?.deleteObject(a)
            
            do{
                
                try moc?.save()
                
                candidates.removeObjectAtIndex(self.myTableView.selectedRow)
                
                self.myTableView.reloadData()
            }
            catch{
                
                print("Problem while deleting Object")
            }
        }
        
}
    
    @IBAction func choosePicture(sender: AnyObject)
    {
        
        let x = NSApp.windows
        
        IKPictureTaker().beginPictureTakerSheetForWindow(x[0],
            withDelegate: self,
            didEndSelector: "pictureTakerDidEnd:returnCode:contextInfo:",
            contextInfo: nil)
        
    }
    
    
    
 //MARK: IKPictureTaker delegate

    func pictureTakerDidEnd(picker: IKPictureTaker, returnCode: NSInteger, contextInfo: UnsafePointer<Void>)
    {
        
         self.image = picker.outputImage()
        
        
}
    
    //MARK: Tableview Delegate Methods
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cell = tableView.makeViewWithIdentifier("CustomCell", owner: self) as! CustomCell
        
        let a = candidates[row] as! Candidate
        
        cell.name.stringValue = a.firstName!
        
        cell.name.editable = true
        
        cell.name.selectable = true
        
        cell.phone.editable = true
        
        cell.phone.selectable = true
        
        cell.phone.stringValue = a.phone!
        
        if let img = a.photo{
        
        cell.Cimage.image = NSImage(data:img)
            
        }
        
        cell.info.target = self
        
        cell.info.action = "showCandidateInfo:"
        
        return cell
    
    }
    

    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        
        return self.candidates.count
    }
    

    func tableView(tableView: NSTableView, heightOfRow row: Int) -> CGFloat{
       
        return 70
    }


    
    
   //MARK: Modal Helper Methods
    
    func clearAll(){
        
        self.firstNameField.stringValue = ""
        
        self.lastNameField.stringValue = ""
        
        self.phoneField.stringValue = ""
        
        self.emailField.stringValue = ""
        
        self.companyField.stringValue = ""
        
        self.experienceField.stringValue = ""
    }
    
    
    func loadData(){
        
        self.candidates.removeAllObjects()
        
        
        appDel = NSApplication.sharedApplication().delegate as? AppDelegate
        
        
        
        let entity = NSEntityDescription.entityForName("Candidate", inManagedObjectContext: appDel!.managedObjectContext)
        
        let fetch = NSFetchRequest()
        
        let dis = NSSortDescriptor(key: "firstName", ascending: false)
        
        fetch.sortDescriptors = [dis]
        
        fetch.entity = entity
        
        
        
        do
        {
            
            let records = try appDel!.managedObjectContext.executeFetchRequest(fetch)
            
            if records.count > 0{
                
                for x in records{
                    
                    let a = x as! Candidate
                    
                    
                    self.candidates.addObject(a)
                    
                }
            }
        }
            
        catch
        {
            
            print("Error occured while fetching")
        }
        
        
    }
    
   
    
    func showCandidateInfo(sender:NSButton){
        
        print("Working Lord")
        
        let a = candidates[self.myTableView.rowForView(sender)] as! Candidate
        
        self.firstNameField.stringValue = a.firstName!
        
        self.lastNameField.stringValue = a.lastname!
        
        self.phoneField.stringValue = a.phone!
        
        self.emailField.stringValue = a.email!
        
        self.companyField.stringValue = a.companyName!
        
        self.experienceField.stringValue = a.experience!
        
        self.dateField.dateValue = a.dateOfBirth!
        
        if a.passport! == true{
            
            self.passportField.stringValue = "1"
            
        }else{
            
            self.passportField.stringValue = "0"
            
        }
}

    
    func control(control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        
        let index = self.myTableView.selectedRow
        
        let  a = candidates[index] as! Candidate
        
        print(a)
        
        if control.tag == 0 {
            
            a.firstName = fieldEditor.string
            
        }else{
            
            a.phone = fieldEditor.string
        }
        
        do{
            
            try a.managedObjectContext?.save()
        }
        catch{
            
            print("Problem While Editing")
            
        }
        
        return true
    }
    
    func validation()->Bool{
        
       if self.firstNameField.stringValue == "" || self.emailField.stringValue == "" || self.companyField.stringValue == ""{
        
        showAlert("Enter candidate Details", infor: "Please enter all the Candidate info")
        
        return false
        
       }else if image == nil{
        
        
        showAlert("Select Candidate Image", infor:"")
        
        return false
        
        }
       else{
        
       return  true
        }
        
        
        
    }
   
    
    func showAlert(mes:String,infor:String){
        
        let alert:NSAlert = NSAlert()
        
        alert.messageText = mes
        
        alert.informativeText = infor
        
        alert.icon = NSImage(named: "")
        
        alert.addButtonWithTitle("OK")
        
        alert.runModal()
    }



}
