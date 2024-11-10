//
//  ContentView.swift
//  iostesttask
//
//  Created by Sarvar Boltaboyev on 10/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Playing")
                .font(.title)
                .bold()
                .padding(.top)
            Spacer()
            Divider()
                .background(.black)
                .padding(.bottom)
            
            VStack {
                HStack {
                    Text("Sleep timer")
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("20 min")
                    }
                }
                
                Divider()
                    .background(.black)
                    .padding([.top, .bottom])
                HStack {
                    Text("Alarm")
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("08:30 am")
                    }
                }
                Divider()
                    .background(.black)
                    .padding(.top)
            }
            .padding([.bottom], 90)
            
            
            Button {
                
            } label: {
                Text("Pause")
                    .frame(width: 300, height: 45)
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
