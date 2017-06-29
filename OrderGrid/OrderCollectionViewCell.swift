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
    @IBOutlet weak var OrderBtn: UIButton!
    
    let model : FirebaseRDModel = FirebaseRDModel()
    let ordermodel : FirebaseMenueModel = FirebaseMenueModel()
    var FirebaseController : FirebaseDatabasePushController! = FirebaseDatabasePushController()
    
    
    
    
    @IBAction func OrderAction(_ sender: UIButton) {
        print("Item to be ordered!" + ItemNameLabel.text!)
        FirebaseController.addNewOrder(name: ordermodel.getElement(from: sender.tag).name, price: ordermodel.getElement(from: sender.tag).price, table: model.getTable())
        
        
    }
}
