//
//  ToolbarSelection.swift
//  Cards
//
//  Created by Sarvar Boltaboyev on 30/12/24.
//

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
    var id: Int {
       hashValue
    }
    
    case photoModal, frameModal, stickerModal, textModal
    
}
