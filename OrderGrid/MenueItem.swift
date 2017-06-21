//
//  MenueItem.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 21.06.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit
import Firebase

struct MenueItem {
    
    let key: String
    let name: String
    let price : Double
    let ref: DatabaseReference?
    let image : UIImage
    
    init(name: String, price: Double, image : UIImage, key: String = "") {
        self.key = key
        self.name = name
        self.price = price
        self.image = image
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        price = snapshotValue["price"] as! Double
        image = #imageLiteral(resourceName: "one")
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "price": price,
            "image": image
        ]
    }
    
}
