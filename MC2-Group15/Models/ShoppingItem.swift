//
//  Product.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/26/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import Foundation

struct ShoppingItem {
    let id: UUID
    let name: String
    let description: String
    let quantity: Int
    let quantityUnit: String
    let price: Int
    
    init(name: String,
         description: String,
         quantity: Int,
         quantityUnit: String,
         price: Int) {
    
        self.id = UUID()
        self.name = name
        self.description = description
        self.quantity = quantity
        self.quantityUnit = quantityUnit
        self.price = price
    }
    
    init(from item: ShoppingItem) {
        self.id           = item.id
        self.name         = item.name
        self.description  = item.description
        self.quantity     = item.quantity
        self.quantityUnit = item.quantityUnit
        self.price        = item.price
    }
}

// MARK: - For price formatting

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String {
        Formatter.withSeparator.string(for: self) ?? ""
    }
}
