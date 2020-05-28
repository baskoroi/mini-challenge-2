//
//  HistoryViewController.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/27/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import UIKit

class ShoppedItemCell: UITableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
}

class HistoryDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var shoppedItemsTable: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let arrivalDate = shoppingHistory.arrivalDate {
            title = Date().getLocalTimeIntervalText(transactionDate: arrivalDate)
        } else {
            title = "Pesanan Sebelumnya"
        }
        
        totalPriceLabel.text = shoppingHistory.totalPriceText
    }
    
    // MARK: - data source & displaying
    
    // TODO change as per selected row in history table view
//    var shoppedItemsList: [ShoppingItem] = []
    var shoppingHistory: ShoppingHistory!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingHistory.shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.shoppedItemsTable.dequeueReusableCell(
            withIdentifier: "shoppedItem", for: indexPath) as! ShoppedItemCell
    
        let item = shoppingHistory.shoppingItems[indexPath.row]
        cell.itemNameLabel.text = item.summarySentence
        cell.itemDescriptionLabel.text = item.description.isEmpty ?
            "(Tidak ada catatan tambahan)" : item.description

        return cell
    }

    @IBAction func reorderPerHistory(_ sender: UIButton) {
        
//        self.performSegue(withIdentifier: "showReorderSummary", sender: self)
//        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        guard let summaryVC = segue.destination as? SummaryViewController else { return }
        // Pass the selected object to the new view controller.
        summaryVC.purchaseOrder = shoppingHistory
    }

}
