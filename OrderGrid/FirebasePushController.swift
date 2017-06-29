//
//  FirebasePushController.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 31.05.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit
import Firebase

class FirebaseDatabasePushController: NSObject {
    let orderref = Database.database().reference(withPath: "order")
    let resref = Database.database().reference(withPath: "restaurant")
    var thisResRef = DatabaseReference()
    
    override init() {
        super .init()
        thisResRef = resref.child("schlappenbiertränke")
    }

    
    func addNewOrder (name : String , price : Double, table : Int){
        let orderitem = OrderItem(name: name, table: table, price: price)
        let orderItemRef = self.orderref.childByAutoId()
        orderItemRef.setValue(orderitem.toAnyObject())
    }
    
    
    
    
}
