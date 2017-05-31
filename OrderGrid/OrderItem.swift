//
//  OrderItem.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 23.05.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit
import Firebase

struct OrderItem {
    
    let key: String
    let name: String
    let table: String
    let ref: DatabaseReference?
    var price: String
    
    init(name: String, table: String, price: String, key: String = "") {
        self.key = key
        self.name = name
        self.table = table
        self.price = price
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        table = snapshotValue["table"] as! String
        price = snapshotValue["price"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "table": table,
            "price": price
        ]
    }
    
}