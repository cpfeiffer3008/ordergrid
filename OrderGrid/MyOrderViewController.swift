//
//  MyOrderViewController.swift
//  OrderGrid
//
//  Created by Christian Pfeiffer on 14.06.17.
//  Copyright © 2017 Christian Pfeiffer. All rights reserved.
//

import UIKit

class MyOrderViewController: UIViewController {
    let model = FirebaseRDModel()
    let myFormatter : EuroFormatter = EuroFormatter()
    var datasource : OrderDataSource!
    var delegate : OrderDelegate!
    
    @IBOutlet weak var SelectedTableLabel: UILabel!
    @IBOutlet weak var OrderTable: UITableView!
    @IBOutlet weak var totalPrice: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSelectedTableLabel()
        
        datasource = OrderDataSource()
        delegate = OrderDelegate()
        
        OrderTable.delegate = delegate
        OrderTable.dataSource = datasource
        
        
        let nc = NotificationCenter.default
        
        nc.addObserver(self, selector: #selector(reloadOrderTable), name: Notification.Name("firereload"), object: nil)
        
        model.observeFirebaseOrders()
        print(model.numberofEntries())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setSelectedTableLabel()
        reloadOrderTable()
    }
    
    func reloadOrderTable(){
        print("was told to reload Table!")
        OrderTable.reloadData()
        calculateTotalPrice()
    }
    
    func setSelectedTableLabel(){
    SelectedTableLabel.text = ("Tisch: \(model.getTable())")
    }
    
    func calculateTotalPrice(){
       totalPrice.text =  ("Gesamtpreis: \(myFormatter.string(for: model.calculateToatalPrice())!)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
