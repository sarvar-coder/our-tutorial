//
//  String+Ext.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import Foundation

extension String {
    var isWhiteEmptySpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
