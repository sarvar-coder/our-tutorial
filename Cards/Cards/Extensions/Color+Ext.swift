//
//  Color+Ext.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 01/01/25.
//

import Foundation
import SwiftUI

extension Color {
    static let colors: [Color] = [
        .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
    ]
    
    static func random() -> Color {
        colors.randomElement() ?? .black
    }
}
