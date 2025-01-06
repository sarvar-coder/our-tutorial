//
//  Checklist.swift
//  Section2
//
//  Created by Sarvar Boltaboyev on 29/07/24.
//

import Foundation

class Checklist: NSObject, Codable {
    var name: String
    var items = [ChecklistItem]() // chapter 17
    var iconName = "No Icon"  // chapter 19
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int{
        var count = 0
        for item in items where !item.checked  {
            count += 1
        }
        return count
    }
}
