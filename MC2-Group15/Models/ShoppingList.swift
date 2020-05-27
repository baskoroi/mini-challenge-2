//
//  ShoppingList.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/27/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import UIKit

struct ShoppingList {
    let id: UUID
    let name: String
    let image: UIImage?
    let shoppingItems: [ShoppingItem]
    
    init(name: String, image: UIImage?, shoppingItems: [ShoppingItem] = []) {
        self.id            = UUID()
        self.name          = name
        self.image         = image
        self.shoppingItems = shoppingItems
    }
    
    init(from list: ShoppingList) {
        self.id            = list.id
        self.name          = list.name
        self.image         = list.image
        self.shoppingItems = list.shoppingItems
    }
}
