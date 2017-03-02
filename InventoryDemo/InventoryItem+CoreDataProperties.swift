//
//  InventoryItem+CoreDataProperties.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 3/2/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension InventoryItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InventoryItem> {
        return NSFetchRequest<InventoryItem>(entityName: "InventoryItem");
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int32
    @NSManaged public var category: InventoryCategory?

}
