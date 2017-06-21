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
    let model : FirebaseRDModel = FirebaseRDModel()
    
    var FirebaseController : FirebasePushController! = FirebasePushController()
    
    
    
    
    @IBAction func OrderAction(_ sender: Any) {
        print("Item to be ordered!" + ItemNameLabel.text!)
        FirebaseController.addNewOrder(name: ItemNameLabel.text!, price: ItemPriceLabel.text!, table: model.getTable())
        
        
    }
}
