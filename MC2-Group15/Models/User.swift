//
//  User.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/27/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import Foundation

struct User {
    let id: UUID
    let name: String
    let phone: String
    let pin: String
    let userType: UserType
    let pickupAddress: String
    
    init(name: String, phone: String, pin: String, userType: UserType, pickupAddress: String = "") {
        self.id = UUID()
        self.name = name
        self.phone = phone
        self.pin = pin
        self.userType = userType
        self.pickupAddress = pickupAddress
    }
}

enum UserType {
    case helper
    case elder
}
