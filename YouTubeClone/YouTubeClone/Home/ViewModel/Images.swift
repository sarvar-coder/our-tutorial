//
//  Images.swift
//  YouTubeClone
//
//  Created by Sarvar Boltaboyev on 29/11/24.
//

import Foundation
import SwiftUI

class Images: ObservableObject {
    @Published var service = DummyService()
    @Published var dummyImages = [DummyImage]()
    
    init() {
       fetch()
    }
    
   private func fetch() {
        service.fetch { result in
            switch result {
            case .success(let success):
                self.dummyImages = success
//                print(self.dummyImages)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
