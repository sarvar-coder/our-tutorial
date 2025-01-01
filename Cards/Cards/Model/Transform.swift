//
//  Transform.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 01/01/25.
//

import Foundation
import SwiftUI

struct Transform {
    var size = CGSize(width: Settings.defaultElementSize.width,
                      height: Settings.defaultElementSize.height)
    var rotation: Angle = .zero
    var offset: CGSize = .zero
}
