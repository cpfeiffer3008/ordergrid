//
//  MyCollectionViewCell.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 31.05.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit

class OrderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ItemImageView: UIImageView!
    @IBOutlet weak var ItemNameLabel: UILabel!
    @IBOutlet weak var ItemPriceLabel: UILabel!
    
    @IBAction func OrderAction(_ sender: Any) {
        print("Item to be ordered!" + ItemNameLabel.text!)
    }
}
