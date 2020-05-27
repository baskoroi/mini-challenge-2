//
//  ShoppingListsHelper.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/26/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import UIKit

class CuratedShoppingListsHelper {
    
    // initialize dummy database here
    static var shared = CuratedShoppingListsHelper(lists: [
        CuratedShoppingList(
            name: "Spesial Hari ini: Opor Ayam",
            image: UIImage(named: "opor-ayam"),
            shoppingItems: [
                // TODO fill shopping items here, THEN SEND IT TO MC2-GROUP15 PROJECT
            ]
        ),
        CuratedShoppingList(
            name: "Jajanan Minimart",
            image: UIImage(named: "minimart"),
            shoppingItems: [
                // TODO fill shopping items here, THEN SEND IT TO MC2-GROUP15 PROJECT
            ]
        ),
        CuratedShoppingList(
            name: "Belanjaan Pasar Modern",
            image: UIImage(named: "pasar-tradisional"),
            shoppingItems: [
                // TODO fill shopping items here, THEN SEND IT TO MC2-GROUP15 PROJECT
            ]
        ),
    ])
    
    private var curatedLists: [CuratedShoppingList]
    
    private init(lists: [CuratedShoppingList]) {
        curatedLists = lists
    }
    
    func create(_ list: CuratedShoppingList) {
        if contains(id: list.id) { return }
        
        // new list becomes more easily searchable than older ones
        curatedLists.insert(list, at: 0)
    }
    
    func createAll(_ collection: [CuratedShoppingList]) {
        for list in collection {
            curatedLists.append(list)
        }
    }
    
    func read(id: UUID) -> CuratedShoppingList? {
        let result = curatedLists.filter { (list) -> Bool in
            id == list.id
        }
        return result.isEmpty ? nil : result[0]
    }
    
    func indexOf(id: UUID) -> Int {
        let result = curatedLists.enumerated().filter { (offset, list) -> Bool in
            id == list.id
        }
        
        return result.isEmpty ? -1 : result[0].offset
    }
    
    func update(id: UUID, newList: CuratedShoppingList) {
        let index = indexOf(id: id)
        guard index != -1 else { return }
        
        curatedLists[index] = CuratedShoppingList(from: newList)
    }
    
    func getAll() -> [CuratedShoppingList] { curatedLists }
    
    func count() -> Int { curatedLists.count }
    func isEmpty() -> Bool { curatedLists.count > 0 }
    func contains(id: UUID) -> Bool {
        for list in curatedLists {
            if id == list.id {
                return true
            }
        }
        return false
    }
    
    func delete(id: UUID) {
        let index = indexOf(id: id)
        guard index != -1 else { return }
        
        curatedLists.remove(at: index)
    }
}
