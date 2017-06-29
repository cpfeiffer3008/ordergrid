//
//  MenueDataSource.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 21.06.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit
import Firebase

class MenueDataSource: NSObject, UICollectionViewDataSource {
    fileprivate let data : FirebaseMenueModel
    fileprivate let FIRStorageController : FirebaseStorageController
    fileprivate let myFormatter : EuroFormatter = EuroFormatter()
    
    
    override init() {
        data = FirebaseMenueModel()
        FIRStorageController = FirebaseStorageController()
    }
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! OrderCollectionViewCell
        
        cell.layer.cornerRadius = 00
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        let tempitem = data.getElement(from: indexPath.row)
        
        print("setting up cell" + String(describing: indexPath))
        cell.ItemNameLabel.text = tempitem.name
        
        cell.ItemPriceLabel.text = myFormatter.string(for: tempitem.price)
        if (!tempitem.ImageDownloadHasStarted){
            cell.ItemImageView.image = FIRStorageController.downloadFromFIRStorage(ref: tempitem.image,forCell:indexPath.row)
            }
        cell.ItemImageView.image = tempitem.imageRes
        cell.ItemImageView.contentMode = .scaleAspectFit
        cell.OrderBtn.tag = indexPath.row
        
        
        
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.numberofEntries()
    }
    
    

}
