//
//  HomeTableViewController.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 2/28/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        inventory.createNewCategory("Knick knacks")
        inventory.createNewCategory("Trinkets")
        print("Home's inventory: \(inventory.inventory)")
    }
    
    var inventory = Inventory()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var destination = segue.destination as? InventoryController {
            destination.inventory = inventory
        }
    }

}
