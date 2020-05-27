//
//  ShoppingListsHelper.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/26/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import UIKit

class ShoppingListsHelper {
    
    // initialize dummy database here
    static var shared = ShoppingListsHelper(lists: [
        ShoppingList(name: "Spesial Hari ini: Opor Ayam", image: UIImage(named: "opor-ayam")),
        ShoppingList(name: "Jajanan Minimart", image: UIImage(named: "minimart")),
        ShoppingList(name: "Belanjaan Pasar Modern", image: UIImage(named: "pasar-tradisional")),
    ])
    
    private var shoppingListsCollection: [ShoppingList]
    
    private init(lists: [ShoppingList]) {
        shoppingListsCollection = lists
    }
    
    func create(_ list: ShoppingList) {
        if contains(id: list.id) { return }
        
        // new list becomes more easily searchable than older ones
        shoppingListsCollection.insert(list, at: 0)
    }
    
    func createAll(_ collection: [ShoppingList]) {
        for shoppingList in collection {
            shoppingListsCollection.append(shoppingList)
        }
    }
    
    func read(id: UUID) -> ShoppingList? {
        let result = shoppingListsCollection.filter { (list) -> Bool in
            id == list.id
        }
        return result.isEmpty ? nil : result[0]
    }
    
    func indexOf(id: UUID) -> Int {
        let result = shoppingListsCollection.enumerated().filter { (offset, list) -> Bool in
            id == list.id
        }
        
        return result.isEmpty ? -1 : result[0].offset
    }
    
    func update(id: UUID, newList: ShoppingList) {
        let index = indexOf(id: id)
        guard index != -1 else { return }
        
        shoppingListsCollection[index] = ShoppingList(from: newList)
    }
    
    func getAll() -> [ShoppingList] { shoppingListsCollection }
    
    func count() -> Int { shoppingListsCollection.count }
    func isEmpty() -> Bool { shoppingListsCollection.count > 0 }
    func contains(id: UUID) -> Bool {
        for list in shoppingListsCollection {
            if id == list.id {
                return true
            }
        }
        return false
    }
    
    func delete(id: UUID) {
        let index = indexOf(id: id)
        guard index != -1 else { return }
        
        shoppingListsCollection.remove(at: index)
    }
}
