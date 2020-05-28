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
                ShoppingItem(name: "Ayam kampung", description: "", quantity: 1, quantityUnit: "kg", price: 70000),
                ShoppingItem(name: "Telur puyuh", description: "", quantity: 3, quantityUnit: "ons", price: 30000),
                ShoppingItem(name: "Santan cair", description: "", quantity: 2, quantityUnit: "bungkus", price: 20000),
                ShoppingItem(name: "Lengkuas", description: "", quantity: 1, quantityUnit: "ons", price: 7000),
                ShoppingItem(name: "Daun salam", description: "", quantity: 4, quantityUnit: "lembar", price: 2500),
                ShoppingItem(name: "Serai", description: "", quantity: 2, quantityUnit: "batang", price: 5000),
                ShoppingItem(name: "Kunyit bubuk", description: "", quantity: 1, quantityUnit: "ons", price: 7000),
                ShoppingItem(name: "Bawang goreng", description: "", quantity: 1, quantityUnit: "ons", price: 6000),
                ShoppingItem(name: "Bawang putih", description: "", quantity: 6, quantityUnit: "Butir", price: 10000),
                ShoppingItem(name: "Bawang merah", description: "", quantity: 2, quantityUnit: "butir", price: 10000),
                ShoppingItem(name: "Kemiri", description: "", quantity: 4, quantityUnit: "butir", price: 8000),
                ShoppingItem(name: "Ketumbar bubuk", description: "", quantity: 1, quantityUnit: "sdt", price: 5000),
            ]
        ),
        CuratedShoppingList(
            name: "Belanjaan Minimart",
            image: UIImage(named: "minimart"),
            shoppingItems: [
                ShoppingItem(name: "Susu Anlene", description: "", quantity: 2, quantityUnit: "box", price: 20000),
                ShoppingItem(name: "Kopi Susu ABC", description: "", quantity: 2, quantityUnit: "paket", price: 15000),
                ShoppingItem(name: "Kopi Kapal Api", description: "", quantity: 2, quantityUnit: "paket", price: 15000),
                ShoppingItem(name: "Energen", description: "", quantity: 1, quantityUnit: "paket", price: 8000),
                ShoppingItem(name: "Biskuit Regal", description: "", quantity: 2, quantityUnit: "bungkus", price: 15000),
                ShoppingItem(name: "Biskuit Khong Guan", description: "", quantity: 1, quantityUnit: "box", price: 30000),
                ShoppingItem(name: "Teh Sariwangi", description: "", quantity: 2, quantityUnit: "bungkus", price: 15000),
                ShoppingItem(name: "Sari Roti", description: "", quantity: 2, quantityUnit: "bungkus", price: 10000),
            ]
        ),
        CuratedShoppingList(
            name: "Belanjaan Pasar Modern",
            image: UIImage(named: "pasar-tradisional"),
            shoppingItems: [
                ShoppingItem(name: "Cabe rawit", description: "", quantity: 250, quantityUnit: "gr", price: 15000),
                ShoppingItem(name: "Tomat", description: "", quantity: 1, quantityUnit: "kg", price: 10000),
                ShoppingItem(name: "Jeruk nipis", description: "", quantity: 250, quantityUnit: "kg", price: 15000),
                ShoppingItem(name: "Cabe merah besar", description: "", quantity: 250, quantityUnit: "gr", price: 35000),
                ShoppingItem(name: "Cabe hijau besar", description: "", quantity: 250, quantityUnit: "gr", price: 35000),
                ShoppingItem(name: "Bawang merah", description: "", quantity: 1, quantityUnit: "kg", price: 20000),
                ShoppingItem(name: "Bawang putih", description: "", quantity: 1, quantityUnit: "kg", price: 20000),
                ShoppingItem(name: "Kentang", description: "", quantity: 1, quantityUnit: "kg", price: 10000),
                ShoppingItem(name: "Jahe", description: "", quantity: 250, quantityUnit: "gr", price: 25000),
                ShoppingItem(name: "Lengkuas", description: "", quantity: 250, quantityUnit: "gr", price: 15000),
                ShoppingItem(name: "Ayam kampung", description: "", quantity: 1, quantityUnit: "ekor", price: 70000),
                ShoppingItem(name: "Ikan kakap merah", description: "", quantity: 1, quantityUnit: "kg", price: 50000),
                ShoppingItem(name: "Daun bawang sledri", description: "", quantity: 250, quantityUnit: "gr", price: 20000),
                ShoppingItem(name: "Labusiam", description: "", quantity: 2, quantityUnit: "bh", price: 10000),
                ShoppingItem(name: "Jagung manis madu", description: "", quantity: 2 , quantityUnit: "bh", price: 15000),
                ShoppingItem(name: "Broccoli", description: "", quantity: 5, quantityUnit: "ons", price: 15000),
                ShoppingItem(name: "Bayam", description: "", quantity: 2 , quantityUnit: "ikat", price: 5000),
                ShoppingItem(name: "Wortel", description: "", quantity: 250, quantityUnit: "gr", price: 25000),
                ShoppingItem(name: "Kacang merah", description: "", quantity: 5, quantityUnit: "ons", price: 10000),
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
