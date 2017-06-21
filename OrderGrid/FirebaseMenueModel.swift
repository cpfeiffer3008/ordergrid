//
//  FirebaseMenueModel.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 21.06.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit


class FirebaseMenueSingleton{
    
    static let sharedInstance = FirebaseMenueSingleton()
    fileprivate var data : [MenueItem] = []
    
    
    private init (){
    }
}
class FirebaseMenueModel: NSObject {
    fileprivate var model = FirebaseMenueSingleton.sharedInstance
    
    override init(){
    }
    
    func numberofEntries() -> Int {
        return model.data.count
    }
    
    func getElement (from i : Int) -> MenueItem {
        return model.data[i]
    }
    
    func set(element: MenueItem, at i : Int){
        model.data[i] = element
    }
    
    func remove(at index: Int) {
        model.data.remove(at: index)
    }
    
    func wipeModel(){
        model.data = []
    }
    
    func append(element : MenueItem){
        model.data.append(element)
    }
        
}
