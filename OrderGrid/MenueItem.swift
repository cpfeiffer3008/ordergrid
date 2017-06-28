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
    let image : StorageReference
    let storage = Storage.storage()
    let storageRef : StorageReference
    
    
    init(name: String, price: Double, image : StorageReference, key: String) {
        self.key = key
        self.name = name
        self.price = price
        self.image = image
        self.ref = nil
        self.storageRef = storage.reference()
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        price = snapshotValue["price"] as! Double
        storageRef = storage.reference()
        let tempimage = snapshotValue["picture"] as! String
        image = storageRef.child("Itempictures/\(tempimage)")
        
        

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
//gs://ordergrid-644f7.appspot.com/Itempictures/Goas.jpg
//gs://ordergrid-644f7.appspot.com/Itempictures/Goas.jpg
