//
//  HomeView.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 29/11/24.
//

import SwiftUI
import Kingfisher
   
struct HomeView: View {
    
    @ObservedObject var images: Images
    @State private var showSideMenu = false
    
    var body: some View {
        tagView
            ZStack(alignment: .top) {
                TabView {
                    HomeListView(images: images.dummyImages)
                }
                
                sideMenu
                
            }
    }
    
    var sideMenu: some View {
        SideMenu(
            isShowing: $showSideMenu,
            content: AnyView(SideMenuView(presentSideMenu: $showSideMenu))
            
            
        )
    }
    
    var tagView: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray).opacity(0.4)
                .frame(width: 40, height: 39)
                .overlay(sidePanelImage)
            HomeTagView()
        }
        .padding([.leading, .trailing], 8)
    }
    
    var sidePanelImage: some View {
        Button {
            showSideMenu.toggle()
        } label: {
            Image(systemName: "safari")
                .font(.title)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    HomeView(images: Images())
}
