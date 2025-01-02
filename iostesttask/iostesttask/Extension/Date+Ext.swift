//
//  Date+Ext.swift
//  iostesttask
//
//  Created by Sarvar Boltaboyev on 10/11/24.
//

import Foundation
extension Date {
    var onlyTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        let dateString = formatter.string(from: self)
        return dateString
    }
}
