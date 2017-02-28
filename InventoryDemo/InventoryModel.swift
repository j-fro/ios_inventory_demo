//
//  InventoryModel.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 2/28/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//

import Foundation

class Inventory {
    public struct InventoryItem {
        public var name: String
        public var category: String
        public var quantity: Int
    }
    
    private var inv = Dictionary<String, InventoryItem>()
    
    public var inventory: Dictionary<String, InventoryItem> {
        get {
            return inv
        }
    }
    
    public func createNewItem(_ item: InventoryItem) {
        inv[item.name] = item
    }
    
    private var catList = Array<String>()
    
    public var categories: Array<String> {
        get {
            return catList
        }
    }
    
    public func createNewCategory(_ category: String) {
        catList.append(category)
    }
}
