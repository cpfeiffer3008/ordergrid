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
    var prices = [Double]()
    var images = [#imageLiteral(resourceName: "one"),#imageLiteral(resourceName: "two"),#imageLiteral(resourceName: "three"),#imageLiteral(resourceName: "four"),#imageLiteral(resourceName: "five"),#imageLiteral(resourceName: "six")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var RestaurantName: UILabel!
    
    
    var PickerDS : UIPickerViewDataSource!
    var pickerDelegate : UIPickerViewDelegate!
    
    var collectionDS: UICollectionViewDataSource!
    var collectionDelegate: UICollectionViewDelegate!
    
    var model : FirebaseRDModel!
    var menueModel : FirebaseMenueModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        collectionDS = MenueDataSource()
        collectionDelegate = MenueDelegate()
        
        collectionView.dataSource = collectionDS
        collectionView.delegate = collectionDelegate
        
        PickerDS = TablePickerDataSource()
        pickerDelegate = TablePickerDelegate()
        
        TablePicker.dataSource = PickerDS
        TablePicker.delegate = pickerDelegate
        
        model = FirebaseRDModel()
        model.observeFirebaseRestaurant()
        menueModel = FirebaseMenueModel()
        
        menueModel.observeFirebaseMenue()
    
        
        let nc = NotificationCenter.default
        
        nc.addObserver(self, selector: #selector(setupMyRestaurant), name: Notification.Name("firerestaurantreload"), object: nil)
        nc.addObserver(self, selector: #selector(reloadCollectionView), name: Notification.Name("fireReloadCollection"), object: nil)
        
        prices = [6.00, 1.20, 4.50, 7.00, 3.50, 1.20]
        //addDummyItems()
        setupMyRestaurant()
        reloadCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadCollectionView(){
    collectionView.reloadData()
    }
    func setupMyRestaurant(){
        print("THE NEW RESTAURANT NAME IS: \(model.getRestaurantName())")
        RestaurantName.text = model.getRestaurantName()
        TablePicker.reloadAllComponents()
    }
    
//    func addDummyItems(){
//        
//        var i : Int = 0
//        while (i<images.count){
//            let newMenuItem = MenueItem(name: names[i], price: prices[i], image : images[, key: "")
//            menueModel.append(element: newMenuItem)
//            print("added: \(newMenuItem)")
//            i=i+1
//        }
//    }
}

