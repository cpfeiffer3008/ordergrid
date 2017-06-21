//
//  FirebaseStorageController.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 21.06.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit
import Firebase

class FirebaseStorageController {
    let storageRef = Storage.storage().reference(withPath: "Itempictures")
    
    func uploadToFIRStorage (data: NSData){
        let uploadMetaData = StorageMetadata()
        let uploadTask = storageRef.putData(data as Data, metadata: uploadMetaData){(metadata,error) in
            if(error != nil){
                print("Error at Uploading to FIRStorage")}
            else {
                print("Upload complete! Have some juicy Metadata: \(uploadMetaData)")}}
    }
    
    func downloadFromFIRStorage(){}
    

}
