//
//  MainView.swift
//  Qu'ran
//
//  Created by Sarvar Boltaboyev on 26/11/24.
//

import Foundation
import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Qu'ran")
                    .font(.largeTitle)
                    .padding()
                // TODO: segmented
                Spacer()
                
            }
            
            Spacer()
        }
    }
}

#Preview {
    MainView()
}
