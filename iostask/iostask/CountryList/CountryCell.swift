//
//  CountryCell.swift
//  iostask
//
//  Created by Sarvar Boltaboyev on 08/11/24.
//

import Foundation
import UIKit
import Kingfisher

class CountryCell: UITableViewCell {
    
    let HstackView = UIStackView()
    let flagImageView = UIImageView()
    let chevronImage = UIImageView()
    let countryView = CountryView() // it contains capital and country name labels
    
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
        isUserInteractionEnabled = true
        
        HstackView.translatesAutoresizingMaskIntoConstraints = false
        HstackView.axis = .horizontal
        
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.contentMode = .scaleAspectFit
//        flagImageView.image = UIImage(systemName: "flag")
        
        countryView.translatesAutoresizingMaskIntoConstraints = false
    
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: "chevron.right", withConfiguration: configuration)
        chevronImage.image = image
        chevronImage.tintColor = .secondaryLabel
        
 
    }
    
    private func layout() {
        
        HstackView.addArrangedSubview(flagImageView)
        HstackView.addArrangedSubview(countryView)
        HstackView.addArrangedSubview(chevronImage)
        
        addSubview(HstackView)
//        HstackView
        NSLayoutConstraint.activate([
            HstackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            HstackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: HstackView.trailingAnchor, multiplier: 1),
            HstackView.heightAnchor.constraint(equalTo: flagImageView.heightAnchor, multiplier: 1)
        ])
        // flag image view  height and width
        flagImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        flagImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        // chevron image
        chevronImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        chevronImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
}

extension CountryCell {
    func configure(with country: Country) {
        countryView.countryLabel.text = country.name
        countryView.capitalLabel.text = country.capital
        if let url = URL(string: country.country_info.flag) {
            flagImageView.kf.setImage(with: url)
        } else {
            flagImageView.image = UIImage(systemName: "photo.badge.exclamationmark.fill")
        }
    }
}
