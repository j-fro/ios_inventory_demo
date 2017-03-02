//
//  InventoryModel.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 2/28/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Inventory {
    
    init() {
        getContext()
    }
    
    var context: NSManagedObjectContext?
    
    func getContext() {
        let fm = FileManager()
        let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first
        let url = directory?.appendingPathComponent("MyDocument")
        let document = UIManagedDocument(fileURL: url!)
        if document.documentState == .closed {
            if let path = url?.path {
                if fm.fileExists(atPath: path) {
                    document.open(completionHandler: { success in self.context = document.managedObjectContext })
                } else {
                    document.save(to: document.fileURL, for: .forCreating) { success in self.context = document.managedObjectContext }
                }
            }
        }
    }
    
    private var inv = Array<InventoryItem>()
    
    public var inventory: Array<InventoryItem> {
        get {
            let request = NSFetchRequest<InventoryItem>(entityName: "InventoryItem")
            if let context = context {
                if let items = try? context.fetch(request) {
                    return items
                }
            }
            return []
        }
    }
    
    public func createNewItem(_ name: String, category: InventoryCategory) -> Bool {
        if !inventory.contains(where: { $0.name == name }) {
            if let item = NSEntityDescription.insertNewObject(forEntityName: "InventoryItem", into: context!) as? InventoryItem {
                item.name = name
                item.category = category
                context?.insert(item)
                return true
            }
            return false
        }
        return false
    }
    
    private var catList = Array<InventoryCategory>()
    
    public var categories: Array<InventoryCategory> {
        get {
            let request = NSFetchRequest<InventoryCategory>(entityName: "InventoryCategory")
            if let context = context {
                if let categories = try? context.fetch(request) {
                    return categories
                }
            }
            return []
        }
    }
    
    public func createNewCategory(_ name: String) -> Bool {
        if !categories.contains(where: { $0.name == name }) {
            if let category = NSEntityDescription.insertNewObject(forEntityName: "InventoryCategory", into: context!) as? InventoryCategory {
                category.name = name
                context?.insert(category)
                return true
            }
            return false
        }
        return false
    }
}
