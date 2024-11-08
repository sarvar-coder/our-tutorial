//
//  CountryCell.swift
//  iostask
//
//  Created by Sarvar Boltaboyev on 08/11/24.
//

import Foundation
import UIKit

class CountryCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CountryCell {
    private func setup() {
        
    }
    
    private func layout() {
        
    }
}
