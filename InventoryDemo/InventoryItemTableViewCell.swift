//
//  InventoryItemTableViewCell.swift
//  InventoryDemo
//
//  Created by Jacob Froman on 3/2/17.
//  Copyright © 2017 Jacob Froman. All rights reserved.
//

import UIKit

class InventoryItemTableViewCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        item = InventoryItem()
        super.init(coder: aDecoder)
    }
    
    var item: InventoryItem {
        didSet {
            itemName.text = item.name
            itemCategory.text = item.category?.name
            itemQuantity.text = String(item.quantity)
        }
    }
    
    public func resetItem(_ item: InventoryItem) {
        self.item = item
    }

    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemCategory: UILabel!
    
    @IBOutlet weak var itemQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
