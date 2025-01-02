//
//  HomeListView.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 30/11/24.
//

import SwiftUI

struct HomeListView: View {
    let images: [DummyImage]
    var body: some View {
         
        List {
            ForEach(images) { image in
                HomeCellView(image: image)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    HomeListView(images: [
        DummyImage(
        id: "1",
        author: "Sarvaar",
        url: "1234",
        download_url: "https://picsum.photos/id/24/4855/1803"),
        
        DummyImage(
        id: "2",
        author: "Sarvaar",
        url: "1234",
        download_url: "https://picsum.photos/id/11/2500/1667"),
        
        DummyImage(
        id: "3",
        author: "Sarvaar",
        url: "1234",
        download_url: "https://picsum.photos/id/8/5000/3333"),
        
        DummyImage(
        id: "4",
        author: "Sarvaar",
        url: "1234",
        download_url: "https://picsum.photos/id/5/5000/3334"),
         
    ])
}
