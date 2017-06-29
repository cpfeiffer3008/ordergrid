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
    let menumodel : FirebaseMenueModel = FirebaseMenueModel()
    var FirebaseController : FirebaseDatabasePushController! = FirebaseDatabasePushController()
    
    
    
    
    @IBAction func OrderAction(_ sender: UIButton) {
        let nc = NotificationCenter.default
        
        let tempitem : MenueItem = menumodel.getElement(from: sender.tag)
        model.setItemtobeOrdered(item: tempitem)
        nc.post(name: Notification.Name("OrderAction"), object: nil)
        print("Item to be ordered!" + ItemNameLabel.text!)
        
        //FirebaseController.addNewOrder(name: ordermodel.getElement(from: sender.tag).name, price: ordermodel.getElement(from: //sender.tag).price,  //table: model.getTable())
        }
    
    func pushOrderToFIR (orderitem : OrderItem){
        FirebaseController.addNewOrder(name: orderitem.name, price: orderitem.price, table: model.getTable())
    }
}
