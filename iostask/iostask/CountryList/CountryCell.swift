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
    let descriptionLabel = UILabel()
    let countryView = CountryView()
    
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
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = """
Recall that the snapshot is just an image of the app’s current display. With that in mind, you could make a custom View for when watchOS takes a snapshot and completely redesign the UI. Don’t do that.
"""
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
    }
    
    private func layout() {
        
        HstackView.addArrangedSubview(flagImageView)
        HstackView.addArrangedSubview(countryView)
        HstackView.addArrangedSubview(chevronImage)
        
        addSubview(HstackView)
        addSubview(descriptionLabel)
//        HstackView
        NSLayoutConstraint.activate([
            HstackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            HstackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: HstackView.trailingAnchor, multiplier: 1),
            HstackView.heightAnchor.constraint(equalTo: flagImageView.heightAnchor, multiplier: 1)
        ])
        // description label
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: HstackView.bottomAnchor, multiplier: 2),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 1)
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
        descriptionLabel.text = country.description_small
        if let url = URL(string: country.country_info.flag) {
            flagImageView.kf.setImage(with: url)
        } else {
            flagImageView.image = UIImage(systemName: "photo.badge.exclamationmark.fill")
        }
    }
}
