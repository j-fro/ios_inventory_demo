//
//  ViewController.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 2/28/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    override func viewDidLoad() {
        inventory.createNewCategory("Knick knacks")
        inventory.createNewCategory("Trinkets")
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
    }
    
    var inventory = Inventory()

    @IBOutlet weak var categoryPicker: UIPickerView!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBAction func createNewItem(_ sender: UIButton) {
        let category = inventory.categories[(categoryPicker?.selectedRow(inComponent: 0))!]
        let newItem = InventoryItem(name: (nameField?.text)!, category: category, quantity: 0)
        inventory.createNewItem(newItem)
        print(inventory.inventory)
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
        return inventory.categories[row]
    }
}

