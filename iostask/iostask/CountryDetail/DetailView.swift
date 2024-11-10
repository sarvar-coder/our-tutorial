//
//  DetailView.swift
//  iostask
//
//  Created by Sarvar Boltaboyev on 09/11/24.
//

import Foundation
import UIKit
import Kingfisher

class DetailView: UIView {
    
    let HstackView = UIStackView()
    let iconImage = UIImageView()
    let textLabel = UILabel()
    let infoLabel = UILabel()
    let dividerView = UIView()

    
    let imageName: String
    let text: String
    let info: String
    init(imageName: String, text: String, info: String) {
        self.imageName = imageName
        self.text = text
        self.info = info
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: frame.size.width, height: 40)
    }
    
    func style() {
        HstackView.translatesAutoresizingMaskIntoConstraints = false
        HstackView.axis = .horizontal
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        iconImage.image = image
        iconImage.contentMode = .scaleAspectFit
        iconImage.tintColor = .systemYellow
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = text
        textLabel.textColor = .label
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.text = info
        infoLabel.textColor = .secondaryLabel
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .systemGray4
    }
    
    func layout() {
        addSubview(iconImage)
        addSubview(textLabel)
        addSubview(infoLabel)
        addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            iconImage.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            
            textLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 20),
            textLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            
            trailingAnchor.constraint(equalToSystemSpacingAfter: infoLabel.trailingAnchor, multiplier: 1),
            infoLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            // divider view
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textLabel.bottomAnchor, multiplier: 2),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1)
            
        ])
    }
}
