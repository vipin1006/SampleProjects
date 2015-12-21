//
//  MainWindowController.swift
//  ErrorHanding
//
//  Created by padalingam agasthian on 19/10/15.
//  Copyright © 2015 padalingam agasthian. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController
{
    let favoriteSnacks = [
        "Alice": "Chips",
        "Bob": "Licorice",
        "Eve": "Pretzels",
    ]
    override func windowDidLoad()
    {
        super.windowDidLoad()
        let vendingMachine = VendingMachine()
        vendingMachine.coinsDeposited = 8
        do {
             try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
        }
        catch VendingMachineError.InvalidSelection
        {
            print("Invalid Selection.")
        }
        catch VendingMachineError.OutOfStock
        {
            print("Out of Stock.")
        }
        catch VendingMachineError.InsufficientFunds(let coinsNeeded)
        {
            
            print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
        }catch
        {
            print("default")
        }

    }
    
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws
    {
        let snackName = favoriteSnacks[person] ?? "Candy Bar"
        try vendingMachine.vend(itemNamed: snackName)
    }
    
}

enum VendingMachineError: ErrorType
{
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

struct Item
{
    var price: Int
    var count: Int
}

class VendingMachine
{
    
    
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String)
    {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws
    {
        guard var item = inventory[name] else
        {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else
        {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else
        {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
    }
}
