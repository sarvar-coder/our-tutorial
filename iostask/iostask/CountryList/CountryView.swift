//
//  CountryView.swift
//  iostask
//
//  Created by Sarvar Boltaboyev on 09/11/24.
//

import Foundation
import UIKit

class CountryView: UIView {
    
    let countryLabel = UILabel()
    let capitalLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func  style() {
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.text = "Sarvar"
        countryLabel.textColor = .label
        
        capitalLabel.translatesAutoresizingMaskIntoConstraints = false
        capitalLabel.text = "Boltaboyev"
        capitalLabel.font = .preferredFont(forTextStyle: .footnote)
        capitalLabel.textColor = .secondaryLabel
    }
    
    func layout() {
        addSubview(countryLabel)
        addSubview(capitalLabel)
        
        NSLayoutConstraint.activate([
            countryLabel.topAnchor.constraint(equalTo: topAnchor),
            countryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countryLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // capital label
            capitalLabel.topAnchor.constraint(equalToSystemSpacingBelow: countryLabel.bottomAnchor, multiplier: 1/2),
            capitalLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            capitalLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
