//
//  FirebaseRDModel.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 31.05.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit
import Firebase

class FirebaseSingleton{
    
    static let sharedInstance = FirebaseSingleton()
    fileprivate var data : [OrderItem] = []
    fileprivate var selectedTable = 1
    fileprivate var tableCount = 5
    fileprivate var RestaurantName : String = ""
    let ref = Database.database().reference(withPath: "order")
    let ref2 = Database.database().reference(withPath: "restaurant/MyFirstRestaurant")
    fileprivate var dataforTable : [OrderItem] = []
    
    private init (){
    }
}

class FirebaseRDModel {
    fileprivate var model = FirebaseSingleton.sharedInstance
    
    init(){
    }
    
    func numberofEntries() -> Int {
        return model.dataforTable.count
    }
    
    func getElement (from i : Int) -> OrderItem {
        return model.dataforTable[i]
    }
    
    func set(element: OrderItem, at i : Int){
        model.dataforTable[i] = element
    }
    
    func remove(at index: Int) {
        model.dataforTable.remove(at: index)
    }
    
    func wipeModel(){
        model.dataforTable = []
    }
    
    func append(element : OrderItem){
        model.dataforTable.append(element)
    }
    
    func observeFirebaseOrders(){
            // 1
            model.ref.observe(.value, with: { snapshot in
            print(snapshot)
            // 2
            var newItems: [OrderItem] = []
            
            // 3
            for item in snapshot.children {
            // 4
            let orderItem = OrderItem(snapshot: item as! DataSnapshot)
            newItems.append(orderItem)
            }
            
            // 5
            self.model.data = newItems
            self.MakeModeltoTableModel()
            print("New Number of Entries is: \(self.model.dataforTable.count)")
            self.notifyTabletoReload()
        })
    }
    
    func observeFirebaseRestaurant(){
        model.ref2.observe(.value, with: { snapshot in
            print(snapshot)
            // 2
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            let newResName : String = postDict["name"]! as! String
            self.setRestaurantName(newName: newResName)
            self.model.tableCount = postDict["tables"] as! Int
            self.notifyRestaurantItemstoReload()
        })
    }
    
    func MakeModeltoTableModel(){
        self.wipeModel()
        for OrderItem in model.data {
            print("OrderItem: \(OrderItem.table) SelectedTable: \(model.selectedTable)")
             if (OrderItem.table == model.selectedTable) {
                self.append(element: OrderItem)
            }
            else{
            print(OrderItem.table)}
        }
        self.notifyTabletoReload()
        
    }
    
    func setRestaurantTitle(newTitle : String){
        model.RestaurantName = newTitle
    }
    
    func setTableCount (newCount : Int){
        model.tableCount = newCount
    }
    
    func notifyTabletoReload(){
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("firereload"), object: nil)
    }
    
    func notifyRestaurantItemstoReload(){
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("firerestaurantreload"),object: nil)
    }
    
    
    func setTable(Table : Int){
        model.selectedTable = Table
    }
    
    func getTable() ->Int {
        return model.selectedTable
    }
    
    func getTableCount() ->Int {
        return model.tableCount
    }
    
    func setRestaurantName(newName : String){
        model.RestaurantName = newName
    }
    
    func getRestaurantName() -> String {
        return model.RestaurantName
    }
    
    func calculateToatalPrice() ->Double{
        var totalPrice : Double = 0
        for OrderItem in model.dataforTable {
        totalPrice = totalPrice + Double(OrderItem.price)
        }
        return totalPrice
    }
    
    func debugPrint(){
        for OrderItem in model.dataforTable {
            print("behnis \(String(describing: OrderItem))")
        }
    }
    
}
