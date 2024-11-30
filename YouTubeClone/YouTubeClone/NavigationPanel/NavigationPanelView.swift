//
//  NavigationPanelView.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 29/11/24.
//

import SwiftUI

struct NavigationPanelView: View {
    @State private var state: PanelState = .none
    var body: some View {
        HStack(spacing: 0) {
            
            AsyncImage(url: ImageAddress.logoURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
                .frame(width: 60, height: 48)
                .aspectRatio(contentMode: .fit)
            
            Text("YouTube")
                .font(.title)
                .bold()
            Spacer()
            leftSidePanel
            
        }
    }
    
    var leftSidePanel: some View {
        HStack(spacing: 20) {
            connectImage
            notificationImage
            searchImage
        }
        .font(.title2)
    }
    
    var connectImage: some View {
        Image(systemName: "wifi.square")
            .onTapGesture {
                print("wifi")
            }
    }
    
    var notificationImage: some View {
        Image(systemName: "bell")
            .onTapGesture {
                print("wifi")
            }
    }
    
    var searchImage: some View {
        Image(systemName: "magnifyingglass")
            .onTapGesture {
                print("wifi")
            }
    }
}

#Preview {
    NavigationPanelView()
}

enum PanelState {
    case connect
    case notify
    case search
    case none
    
    var id: Int? {
        switch self {
        case .connect:
            1
        case .notify:
            2
        case .search:
            3
        case .none:
            nil
        }
    }
}

struct ImageAddress {
    static let logoURL = URL(string: logo)!
    static let logo =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5jjE8G2wv5YOj3-KmIF83A02dBP4_NUsKMw&s"
}
