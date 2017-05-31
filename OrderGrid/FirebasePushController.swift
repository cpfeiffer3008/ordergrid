//
//  FirebasePushController.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 31.05.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit
import Firebase

class FirebasePushController: NSObject {
    let orderref = Database.database().reference(withPath: "order")
    
    func addNewOrder (name : String , price : String, table String){
    
    }
}
