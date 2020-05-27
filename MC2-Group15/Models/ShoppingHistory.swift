//
//  ShoppingHistory.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/27/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import Foundation

struct ShoppingHistory {
    
    let date: Date
    let shoppingItems: [ShoppingItem]
    
    var totalPrice: String {
        "Rp\(75000.formattedWithSeparator),-"
    }
    
}
