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
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var RestaurantName: UILabel!
    
    
    var PickerDS : UIPickerViewDataSource!
    var pickerDelegate : UIPickerViewDelegate!
    
    var collectionDS: UICollectionViewDataSource!
    var collectionDelegate: UICollectionViewDelegate!
    let myFormatter : EuroFormatter = EuroFormatter()
    var FirebaseController : FirebaseDatabasePushController! = FirebaseDatabasePushController()
    
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
        nc.addObserver(self, selector: #selector(showOrderDialog), name: Notification.Name("OrderAction"), object: nil)
        
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
    
    func showOrderDialog(){
        let tempitem: MenueItem = model.getItemtobeOrdered()
        
        let alertSheetController = UIAlertController(title: "Bestellung", message: "Wollen sie: \(tempitem.name) für: \(myFormatter.string(for: tempitem.price) ?? ("0,00€")) bestellen?",preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Abbrechen", style: .cancel) { action -> Void in
//            todo: cancelAction
        }
        alertSheetController.addAction(cancelAction)
        
        let enterAction = UIAlertAction(title: "Bestellen", style: .default) { action -> Void in
                self.orderMyItem()
            }
        alertSheetController.addAction(enterAction)
        
        self.present(alertSheetController, animated: true) {}
    }
    
    func orderMyItem(){
        let tempitem: MenueItem = model.getItemtobeOrdered()
        print("Getting ordered: \(tempitem))")
        FirebaseController.addNewOrder(name: tempitem.name, price: tempitem.price, table: model.getTable())
        
        
        
        
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

