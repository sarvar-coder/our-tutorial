//
//  HomeCellView.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 30/11/24.
//

import SwiftUI
import Kingfisher

struct HomeCellView: View {
    let image: DummyImage
    var body: some View {
        VStack {
            KFImage(URL(string: image.download_url))
                .resizable()
                .frame(width: 400, height: 200)
                .aspectRatio(contentMode: .fit)
            
            HStack(spacing: 20) {
                KFImage(URL(string: image.download_url))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text(image.author)
                        .bold()
                    HStack(spacing: 30) {
                
                        Text("\(image.id)2 mln times")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                         
                        Text("\(image.id) months ago")
                            .foregroundStyle(.secondary)
                            .font(.footnote)
                    }
                }
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(8)
        }
    }
}

#Preview {
    HomeCellView(image: DummyImage(
        id: "1",
        author: "Alejandro Escamilla",
        url: "",
        download_url: "https://picsum.photos/id/9/5000/3269"))
}
