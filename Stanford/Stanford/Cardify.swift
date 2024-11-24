//
//  Cardify.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 24/11/24.
//

import Foundation
import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12.0)
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
              content
            }
            .opacity(isFaceUp ? 1 : 0)
            
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        
    }
    
    
}
