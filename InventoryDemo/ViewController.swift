//
//  ViewController.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 2/28/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, InventoryController {
    
    override func viewDidLoad() {
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        print("Target's inventory: \(inventory.inventory)")
    }
    
    var inventory = Inventory()

    @IBOutlet weak var categoryPicker: UIPickerView!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func createNewItem(_ sender: UIButton) {
        let category = inventory.categories[(categoryPicker?.selectedRow(inComponent: 0))!]
        let newItem = (nameField?.text)!
        
//        Send the item to the model to store in the database
        if !inventory.createNewItem(newItem, category: category) {
            let alert = UIAlertController(title: "Item Not Created", message: "An Item with that name already exists", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Success!", message: "Item created successfully", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return inventory.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return inventory.categories[row].name
    }
}

