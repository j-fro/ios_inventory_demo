//
//  Item+CoreDataProperties.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 3/2/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Int32
    @NSManaged public var category: Category?

}
