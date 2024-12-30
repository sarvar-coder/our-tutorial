//
//  CardThumbnail.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 30/12/24.
//

import SwiftUI

struct CardThumbnail: View {
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.teal)
            .foregroundColor(.gray)
            .frame(width: 150, height: 250)
    }
}

#Preview {
    CardThumbnail()
}
