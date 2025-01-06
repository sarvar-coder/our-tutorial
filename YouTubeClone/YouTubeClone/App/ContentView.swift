//
//  ContentView.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 29/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    @ObservedObject var images: Images
    var body: some View {
        NavigationPanelView()
            .padding([.leading, .trailing], 8)
        Spacer()
        TabView(selection: $selectedTab,
                content:  {
            HomeView(images: images)
                .tabItem {
                    Image(systemName: "house")
                        .imageScale(.large)
                }.tag(1)
            
            
            Text("Shorts").tabItem {  Image(systemName: "play.rectangle") }.tag(2)
            
            Text("Add Short").tabItem {  Image(systemName: "plus") }.tag(3)
            
            Text("Obunalar").tabItem {  Image(systemName: "play.square.stack") }.tag(4)
            
            Text("You").tabItem {  Image(systemName: "person.crop.circle") }.tag(5)
        })
    }
}

#Preview {
    ContentView(images: Images())
}
