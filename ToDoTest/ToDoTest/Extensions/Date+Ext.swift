//
//  Date+Ext.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 24/11/24.
//

import Foundation

extension Date {
    var dayAndMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d"
        let date = dateFormatter.string(from: self)
        return date
    }
}
