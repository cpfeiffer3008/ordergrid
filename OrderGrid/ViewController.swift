//
//
//  ViewController.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 17.05.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var TablePicker: UIPickerView!
    var names = ["Burger", "Clubmate", "Goasmass", "Pizza", "Radler", "Sandwich"]
    var prices = ["6,00€", "1,20€", "4,50€", "6,50€", "😅", "3,50€"]
    var images = [#imageLiteral(resourceName: "one"),#imageLiteral(resourceName: "two"),#imageLiteral(resourceName: "three"),#imageLiteral(resourceName: "four"),#imageLiteral(resourceName: "five"),#imageLiteral(resourceName: "six")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var RestaurantName: UILabel!
    
    
    var PickerDS : UIPickerViewDataSource!
    var pickerDelegate : UIPickerViewDelegate!
    var model : FirebaseRDModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = MenueDataSource()
        collectionView.delegate = MenueDelegate()
        
        PickerDS = TablePickerDataSource()
        pickerDelegate = TablePickerDelegate()
        
        TablePicker.dataSource = PickerDS
        TablePicker.delegate = pickerDelegate
        
        model = FirebaseRDModel()
        model.observeFirebaseRestaurant()
    
        
        let nc = NotificationCenter.default
        
        nc.addObserver(self, selector: #selector(setupMyRestaurant), name: Notification.Name("firerestaurantreload"), object: nil)
        setupMyRestaurant()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupMyRestaurant(){
        print("THE NEW RESTAURANT NAME IS: \(model.getRestaurantName())")
        RestaurantName.text = model.getRestaurantName()
        TablePicker.reloadAllComponents()
    }
}

