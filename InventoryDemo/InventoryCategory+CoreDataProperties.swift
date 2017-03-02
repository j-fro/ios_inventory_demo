//
//  InventoryCategory+CoreDataProperties.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 3/2/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension InventoryCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InventoryCategory> {
        return NSFetchRequest<InventoryCategory>(entityName: "InventoryCategory");
    }

    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension InventoryCategory {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: InventoryItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: InventoryItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
