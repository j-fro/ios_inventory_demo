//
//  AddCategoryViewController.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 2/28/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController, UITableViewDelegate, InventoryController {
    
    var inventory = Inventory()
    
    private var embeddedTableController: CategoryTableViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CategoryTableViewController {
            destination.inventory = inventory
            embeddedTableController = destination
        }
    }
    
    @IBOutlet weak var embeddedView: UIView!

    @IBOutlet weak var categoryName: UITextField!
    
    @IBAction func addNewCategory(_ sender: UIButton) {
        if let name = categoryName?.text {
            if !inventory.createNewCategory(name) {
                let alert = UIAlertController(title: "Category Not Created", message: "This category already exists", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            embeddedTableController.tableView.reloadData()
        }
    }
}
