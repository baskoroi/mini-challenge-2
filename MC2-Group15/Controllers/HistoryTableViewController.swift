//
//  HistoryTableViewController.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/27/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import UIKit

protocol HistoryCellDelegator {
    func callSegueFromCell(with history: AnyObject)
}

class HistoryCell: UITableViewCell {
    
    var delegate: HistoryCellDelegator!
    var history: ShoppingHistory!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBAction func showShoppingList(_ sender: UIButton) {
        guard delegate != nil && history != nil else { return }
        self.delegate.callSegueFromCell(with: history as AnyObject)
    }
    
    func setup(from history: ShoppingHistory) {
        self.history = history
        if let arrivalDate = history.arrivalDate {
            self.timeLabel.text = Date().getLocalTimeIntervalText(transactionDate: arrivalDate)
        } else {
            self.timeLabel.text = "Beberapa hari sebelumnya"
        }
        self.totalPriceLabel.text = history.totalPriceText
    }
}

class HistoryTableViewController: UITableViewController, HistoryCellDelegator {
    func callSegueFromCell(with history: AnyObject) {
        self.performSegue(withIdentifier: "showHistoryItems", sender: history)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    var shoppingHistoryList: [ShoppingHistory] = ShoppingHistoriesHelper.shared.getAll()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingHistoryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        
        let shoppingHistory = shoppingHistoryList[indexPath.row]
        cell.setup(from: shoppingHistory)
        cell.delegate = self
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistoryItems" {
            if let detailVC = segue.destination as? HistoryDetailViewController,
                let history = sender as? ShoppingHistory {
        
                detailVC.shoppingHistory = history
//                detailVC.shoppedItemsList = history.shoppingItems
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
