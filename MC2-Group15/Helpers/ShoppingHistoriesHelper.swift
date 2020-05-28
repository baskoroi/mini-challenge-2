//
//  ShoppingHistoriesHelper.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/28/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import Foundation

class ShoppingHistoriesHelper {
    
    // initialize dummy database here
    static var shared = ShoppingHistoriesHelper(historyList: [
        ShoppingHistory(address: "Jl. Bunga Matahari 5 no. 17",
                        arrivalDate: Date() - 86400,
                        shoppingItems: [
            ShoppingItem(name: "Susu Anlene", description: "", quantity: 2, quantityUnit: "box", price: 20000),
            ShoppingItem(name: "Kopi Susu ABC", description: "", quantity: 2, quantityUnit: "paket", price: 15000),
            ShoppingItem(name: "Kopi Kapal Api", description: "", quantity: 2, quantityUnit: "paket", price: 15000),
            ShoppingItem(name: "Energen", description: "", quantity: 1, quantityUnit: "paket", price: 8000),
            ShoppingItem(name: "Biskuit Regal", description: "", quantity: 2, quantityUnit: "bungkus", price: 15000),
            ShoppingItem(name: "Biskuit Khong Guan", description: "", quantity: 1, quantityUnit: "box", price: 30000),
            ShoppingItem(name: "Teh Sariwangi", description: "", quantity: 2, quantityUnit: "bungkus", price: 15000),
            ShoppingItem(name: "Sari Roti", description: "", quantity: 2, quantityUnit: "bungkus", price: 10000),
        ]),
        ShoppingHistory(address: "Jl. Bunga Anggrek 6 no. 12",
                        arrivalDate: Date() - (86400 * 2),
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
        ]),
        ShoppingHistory(address: "Jl. Bunga Matahari 5 no. 17",
                        arrivalDate: Date() - (86400 * 3),
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
        ]),
    ])
    
    private var historyList: [ShoppingHistory]
    
    private init(historyList: [ShoppingHistory]) {
        self.historyList = historyList
    }
    
    func create(_ history: ShoppingHistory) {
        if contains(id: history.id) { return }
        
        // new history becomes more easily searchable than older ones
        historyList.insert(history, at: 0)
    }
    
    func createAll(_ collection: [ShoppingHistory]) {
        for history in collection {
            historyList.append(history)
        }
    }
    
    func read(id: UUID) -> ShoppingHistory? {
        let result = historyList.filter { (history) -> Bool in
            id == history.id
        }
        return result.isEmpty ? nil : result[0]
    }
    
    func indexOf(id: UUID) -> Int {
        let result = historyList.enumerated().filter { (offset, history) -> Bool in
            id == history.id
        }
        
        return result.isEmpty ? -1 : result[0].offset
    }
    
    func update(id: UUID, newHistory: ShoppingHistory) {
        let index = indexOf(id: id)
        guard index != -1 else { return }
        
        historyList[index] = ShoppingHistory(from: newHistory)
    }
    
    func getAll() -> [ShoppingHistory] { historyList }
    
    func count() -> Int { historyList.count }
    func isEmpty() -> Bool { historyList.count > 0 }
    func contains(id: UUID) -> Bool {
        for history in historyList {
            if id == history.id {
                return true
            }
        }
        return false
    }
    
    func delete(id: UUID) {
        let index = indexOf(id: id)
        guard index != -1 else { return }
        
        historyList.remove(at: index)
    }
}
