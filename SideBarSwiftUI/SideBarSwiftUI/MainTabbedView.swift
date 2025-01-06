//
//  ContentView.swift
//  SideBarSwiftUI
//
//  Created by Sarvar Boltaboyev on 30/11/24.
//

import SwiftUI

struct MainTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        
        ZStack(alignment: .top){
            
            TabView(selection: $selectedSideMenuTab) {
                
                HomeView()
                    .tag(0)
                FavouriteView()
                    .tag(1)
                ChatView()
                    .tag(2)
                ProfileView()
                    .tag(3)
            }
            listImage
            SideMenu(
                isShowing: $presentSideMenu
                )
        }
    }
    
    var listImage: some View {
        HStack{
            Button{
                presentSideMenu.toggle()
            } label: {
                Image(systemName: "list.bullet")
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            Spacer()
        }
        .padding(.leading)
    }
}

#Preview {
    MainTabbedView()
}
