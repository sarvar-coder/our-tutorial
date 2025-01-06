//
//  CardElement.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 06/01/25.
//

import Foundation
import SwiftUI

protocol CardElement {
  var id: UUID { get }
  var transform: Transform { get set }
}

extension CardElement {
    func index(in array: [CardElement]) -> Int? {
        array.firstIndex { $0.id == id }
    }
}

struct ImageElement: CardElement {
    var id = UUID()
    
    var transform = Transform()
    
    var image: Image
}

struct TextElement: CardElement {
    var id = UUID()
    
    var transform: Transform
    
    var text = ""
    
    var textFont = "Gill Sans"
    
    var textColor = Color.black
}
