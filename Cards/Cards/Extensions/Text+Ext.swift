//
//  Text+Ext.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 06/01/25.
//

import Foundation
import SwiftUI

extension Text {
    func scalableText(font: Font = Font.system(size: 1000)) -> some View {
        self
            .font(font)
            .minimumScaleFactor(0.01)
            .lineLimit(1)
    }
}
