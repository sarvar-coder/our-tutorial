//
//  CountryDetailViewController.swift
//  iostask
//
//  Created by Sarvar Boltaboyev on 09/11/24.
//

import Foundation
import UIKit

class CountryDetailViewController: UIViewController {
    
    let imageView = UIImageView()
    let countryNameLabel = UILabel()
    let VstackView = UIStackView()
    let aboutLabel = UILabel()
    let descriptionLabel = UILabel()
    let scrollView = UIScrollView()

    var viewStack = [UIView]()

    var country: Country?
    init(country: Country? = nil) {
        self.country = country
        let capitalView = DetailView(imageName: "star", text: "Capital", info: country?.capital ?? "")
        let populationView = DetailView(imageName: "person.3", text: "Population", info: "\(country?.population ?? 0)")
        let continentView = DetailView(imageName: "globe.central.south.asia", text: "Continent", info: country?.continent ?? "")
        self.viewStack.append(capitalView)
        self.viewStack.append(populationView)
        self.viewStack.append(continentView)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}
extension CountryDetailViewController {
    private func setup() {
        style()
        layout()
        scrollView.delegate = self
        view.backgroundColor = .systemBackground
        for i in viewStack {
            VstackView.addArrangedSubview(i)
        }
    }
     
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemMint
        
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.font = .preferredFont(forTextStyle: .title1)
        countryNameLabel.text = country?.name ?? ""
        countryNameLabel.textAlignment = .left
        
        VstackView.translatesAutoresizingMaskIntoConstraints = false
        VstackView.axis = .vertical
        VstackView.spacing = 8
        
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.font = .preferredFont(forTextStyle: .title2)
        aboutLabel.text = "About"
        aboutLabel.textAlignment = .left
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.textAlignment = .center
        descriptionLabel.text = country?.description ?? ""
        
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(imageView)
        view.addSubview(scrollView)
        scrollView.addSubview(countryNameLabel)
        scrollView.addSubview(VstackView)
        scrollView.addSubview(aboutLabel)
        scrollView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/5),
            
            // scroll view
            scrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // label
            countryNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 2),
            countryNameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: countryNameLabel.trailingAnchor, multiplier: 1),
            
            // stack View
            VstackView.topAnchor.constraint(equalToSystemSpacingBelow: countryNameLabel.bottomAnchor, multiplier: 2),
            VstackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: VstackView.trailingAnchor, multiplier: 1),
            // about label
            aboutLabel.topAnchor.constraint(equalToSystemSpacingBelow: VstackView.bottomAnchor, multiplier: 3),
            aboutLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            // desrciption label
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: aboutLabel.bottomAnchor, multiplier: 2),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 1)
        ])
    }
}

extension CountryDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scrolled")
    }
}
