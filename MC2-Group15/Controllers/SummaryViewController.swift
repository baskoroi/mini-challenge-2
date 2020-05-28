//
//  SummaryViewController.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/27/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import UIKit

class RequestedItemCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionTextField: UITextField!
    
    func setup(from item: ShoppingItem) {
        self.itemNameLabel.text = item.summarySentence
        self.itemDescriptionTextField.text = item.description
    }
    
}

class SummaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var purchaseOrder: ShoppingHistory!
    @IBOutlet weak var totalPriceTextField: UITextField!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseOrder.shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingItem", for: indexPath) as! RequestedItemCell
        
        let item = purchaseOrder.shoppingItems[indexPath.row]
        
        cell.setup(from: item)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalPriceTextField.text = purchaseOrder.totalPriceText
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        print(shoppingItemsList)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
