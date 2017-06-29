//
//  OrderDataSource.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 20.06.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit

class OrderDataSource: NSObject, UITableViewDataSource {
    fileprivate let data : FirebaseRDModel
    fileprivate let myFormatter : EuroFormatter = EuroFormatter()
    
    override init() {
        data = FirebaseRDModel()
    }
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = OrderCell()
        let index = indexPath.row
        let entry = data.getElement(from: index)
        
        cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell")! as! OrderCell
        
        print("Binding OrderCell")
        cell.ItemLabel.text = entry.name
        cell.PriceLabel.text = myFormatter.string(for: entry.price)
        
        
        return cell
    }
    
    
    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.numberofEntries()
    }
    
    
}
