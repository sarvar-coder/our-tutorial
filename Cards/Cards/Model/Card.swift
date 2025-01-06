//
//  Card.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 06/01/25.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    var elements = [CardElement]()
    let backgroundColor: Color
    
    init(backgroundColor: Color, elements: [CardElement] = []) {
        self.backgroundColor = backgroundColor
        self.elements = elements
    }
}
