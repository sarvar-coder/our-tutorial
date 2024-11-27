//
//  SegmentedView.swift
//  ToDoTest
//
//  Created by Sarvar Boltaboyev on 23/11/24.
//

import SwiftUI

struct SegmentedView: View {
    @Binding var selectedView: ShowState
    var count: Int
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(spacing: 30) {
                
                HStack {
                    
                    Text(ShowState.all.rawValue)
                        .foregroundColor(selectedView == .all ? .blue : .secondary)
                        .bold()
                    
                    BadgeView(count: count, selectedView: selectedView == .all)
                }
                .onTapGesture {
                    selectedView = .all
                }
                
                ExDivider()
                
                HStack {
                    Text(ShowState.done.rawValue)
                        .foregroundColor(selectedView == .done ? .blue : .secondary)
                        .bold()
                    
                    BadgeView(count: 10, selectedView: selectedView == .done)
                }
                .onTapGesture {
                    selectedView = .done
                }
                
                HStack {
                    Text(ShowState.notDone.rawValue)
                        .foregroundColor(selectedView == .notDone ? .blue : .secondary)
                        .bold()
                    
                    BadgeView(count: 5, selectedView: selectedView == .notDone)
                }
                .onTapGesture {
                    selectedView = .notDone
                }
            }
        }
    }
}

#Preview {
    SegmentedView(selectedView: .constant(.all), count: 0)
}

struct ExDivider: View {
    let color: Color = .gray
    let width: CGFloat = 2
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: 20)
            .edgesIgnoringSafeArea(.vertical)
    }
}
