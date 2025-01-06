//
//  HomeTagView.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 29/11/24.
//

import SwiftUI

struct HomeTagView: View {
    
    var tags = ["All", "Today", "Videos", "Podcasts", "Nature", "Movies", "News"]
    
    @State private var opacity: CGFloat = 0.2
    
    var body: some View {
       
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                    ForEach(tags, id: \.self) { tag in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 80, height: 39)
                            .foregroundColor(.gray)
                            .opacity(opacity)
                            .overlay(Text(tag))
                    }
                }
            }
    }
}

#Preview {
    HomeTagView()
}
