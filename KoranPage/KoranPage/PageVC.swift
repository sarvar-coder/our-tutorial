//
//  PageVC.swift
//  KoranPage
//
//  Created by Sarvar Boltaboyev on 31/10/24.
//

import Foundation
import UIKit

class PageVC: UIViewController {
    
    let label = UILabel()
    
    let pageNumber: String
    init(pageNumber: String) {
        self.pageNumber = pageNumber
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    func style() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = pageNumber
        label.font = .preferredFont(forTextStyle: .title1)
        view.addSubview(label)
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


