//
//  SideMenuView.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 30/11/24.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var presentSideMenu: Bool
    var body: some View {
        ZStack {
            Text("hello world")
        }
    }
}

#Preview {
    SideMenuView(presentSideMenu: .constant(false))
}
