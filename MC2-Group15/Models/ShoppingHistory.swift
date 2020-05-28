//
//  ShoppingHistory.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/27/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import Foundation

struct ShoppingHistory {
    
    let id: UUID
    let helper: User?
    let elder: User?
    let address: String
    let arrivalDate: Date
    let shoppingItems: [ShoppingItem]
    
    init(address: String,
         arrivalDate: Date,
         shoppingItems: [ShoppingItem] = []) {
        
        self.id            = UUID()
        self.helper        = nil
        self.elder         = nil
        self.address       = address
        self.arrivalDate   = arrivalDate
        self.shoppingItems = shoppingItems
    }
    
    init(helper: User,
         elder: User,
         address: String,
         arrivalDate: Date,
         shoppingItems: [ShoppingItem]) {
        
        self.id            = UUID()
        self.helper        = helper
        self.elder         = elder
        self.address       = address
        self.arrivalDate   = arrivalDate
        self.shoppingItems = shoppingItems   
    }
    
    init(from history: ShoppingHistory) {
        self.id            = history.id
        self.helper        = history.helper
        self.elder         = history.elder
        self.address       = history.address
        self.arrivalDate   = history.arrivalDate
        self.shoppingItems = history.shoppingItems
    }
    
    var totalPrice: Int {
        return shoppingItems.reduce(0) { result, item in
            return result + item.price
        }
    }
    
    var totalPriceText: String {
        "Rp\(totalPrice.formattedWithSeparator),-"
    }
    
}
