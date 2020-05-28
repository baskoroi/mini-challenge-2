//
//  Date+Extensions.swift
//  MC2Prototype-ShoppingList
//
//  Created by Baskoro Indrayana on 05/28/20.
//  Copyright © 2020 Baskoro Indrayana. All rights reserved.
//

import Foundation

extension Date {
    func getLocalTimeIntervalText(transactionDate: Date,
                                  localeIdentifier: String = "id") -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.locale = Locale(identifier: "id")

        var timeIntervalString = formatter.localizedString(for: transactionDate,
                                         relativeTo: self).localizedCapitalized
        
        // little treatment for non-obvious time interval string
        if timeIntervalString == "Kemarin Lusa" {
            timeIntervalString = "2 Hari Yang Lalu"
        }
        
        return timeIntervalString
    }
}
