//
//  AspectVGrid.swift
//  Stanford
//
//  Created by Sarvar Boltaboyev on 22/11/24.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, ItemView: View>: View {
    
    var items: [Item]
    var aspectRatio: CGFloat = 1
    var content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        
        GeometryReader { geometry in
//            let gridItemSize = gridItemWidthThatFits(count: items.count,
//                                                     size: geometry.size,
//                                                     aspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70), spacing: 0)
                               ], spacing: 0) {
                ForEach(items) { item in
                    content(item)
                        .aspectRatio(2/3, contentMode: .fill) 
                    
                }
            }
            
        }
        
    }
    
    func gridItemWidthThatFits(
        count: Int,
        size: CGSize,
        aspectRatio: CGFloat
    ) -> CGFloat {
        let columnCount = 1
        
        repeat {
            let width = size.width / CGFloat(columnCount)
            let height = width / aspectRatio
            
            let rowCount = Double(count / columnCount).rounded(.up)
            
            if rowCount * height < size.height {
                return (size.width / CGFloat(columnCount)).rounded(.down)
            }
            
        } while columnCount < count
         
        return min(size.width / CGFloat(count), size.height * aspectRatio).rounded(.down)
    }
}

