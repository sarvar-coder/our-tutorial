//
//  BadgeView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct BadgeView: View {
    let count: Int 
    let selectedView: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(selectedView ? .blue : .gray)
            .opacity(1)
            .frame(width: 30, height: 25)
            .overlay(
            Text("\(count)")
                .foregroundColor(.white)
            )
    }
}
