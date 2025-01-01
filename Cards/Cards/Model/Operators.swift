//
//  Operators.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 01/01/25.
//

import Foundation
import SwiftUI
func + (left: CGSize, right: CGSize) -> CGSize {
  CGSize(
    width: left.width + right.width,
    height: left.height + right.height)
}
