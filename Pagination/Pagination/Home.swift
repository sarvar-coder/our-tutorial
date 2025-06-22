//
//  Home.swift
//  Pagination
//
//  Created by Sarvar Boltaboyev on 21/06/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    /// View properties
    @State private var photos: [Photo] = []
    @State private var page: Int = 1
    @State private var lastFetchPage: Int = 1
    @State private var isLoading = false
    
    /// pagination properties
    @State private var activePhotID: String?
    @State private var lastPhotID: String?
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 3), spacing: 10) {
                ForEach(photos) { photo in
                    PhotoCardView(photo: photo)
                }
            }
            .overlay(alignment: .bottom) {
                if isLoading {
                    ProgressView()
                        .offset(y: 30)
                }
            }
            .padding(15)
            
            .scrollTargetLayout()
        }
        .scrollPosition(id: $activePhotID, anchor: .bottomTrailing)
        .onChange(of: activePhotID) { oldValue, newValue in
            if newValue == lastPhotID, !isLoading {
                page += 1
                fetch()
            }
        }
        .onAppear {
            if photos.isEmpty {
                fetch()
            }
        }
    }
    
    /// Fetching photos as per needs
    func fetch() {
        Task {
            do {
                if let url = URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=33") {
                    
                    isLoading = true
                    
                    let session = URLSession(configuration: .default)
                    let jsonData = try await session.data(from: url).0
                    let photos = try  JSONDecoder().decode([Photo].self, from: jsonData)
                    await MainActor.run {
                        if photos.isEmpty {
                           page = lastFetchPage
                        } else {
                            self.photos.append(contentsOf: photos)
                            lastPhotID = photos.last?.id
                            lastFetchPage = page
                        }
                        
                    }
                    isLoading = false
                }
            } catch {
                isLoading = false
                print(error.localizedDescription)
            }
        }
    }
}

/// Photo card View
struct PhotoCardView: View {
    var photo: Photo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            GeometryReader {
                let size = $0.size
                
                AnimatedImage(url: photo.imageURL) {
                    ProgressView()
                        .frame(width: size.width, height: size.height)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
                .clipShape(.rect(cornerRadius: 15))
            }
            .frame(height: 120)
                /// author name
                Text(photo.author)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
            
            
        }
    }
}

#Preview {
    ContentView()
}
