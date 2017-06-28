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
    var tempimage : UIImage? = nil
    
//    func uploadToFIRStorage (data: NSData){
//        let uploadMetaData = StorageMetadata()
//        let uploadTask = storageRef.putData(data as Data, metadata: uploadMetaData){(metadata,error) in
//            if(error != nil){
//                print("Error at Uploading to FIRStorage")}
//            else {
//                print("Upload complete! Have some juicy Metadata: \(uploadMetaData)")}}
//    }
    
    func downloadFromFIRStorage(ref : StorageReference) -> UIImage {
        
        var image : UIImage = #imageLiteral(resourceName: "one")
        print("IMAGE: start")
        print("IMAGE: \(ref)")
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
               print("IMAGE: \(ref) has had a error: \(error)")
            } else {
            print("IMAGE Data: \(String(describing: data))")
            self.saveImage(tempImage: UIImage(data: data!)!)
            }
        }
            return image
    }
    
    func saveImage(tempImage : UIImage){
        tempimage = tempImage
    }
    

}
