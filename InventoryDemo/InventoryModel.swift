//
//  InventoryModel.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 2/28/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//

import Foundation

public struct InventoryItem {
    public var name: String
    public var category: String
    public var quantity: Int
}

class Inventory {
    private var inv = Array<InventoryItem>()
    
    public var inventory: Array<InventoryItem> {
        get {
            return inv
        }
    }
    
    public func createNewItem(_ item: InventoryItem) -> Bool {
        if inv.contains(where: { $0.name == item.name }) {
           return false
        }
        inv.append(item)
        return true
    }
    
    private var catList = Array<String>()
    
    public var categories: Array<String> {
        get {
            return catList
        }
    }
    
    public func createNewCategory(_ category: String) -> Bool {
        if catList.contains(category) {
            return false
        }
        catList.append(category)
        return true
    }
}
