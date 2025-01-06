//
//  ViewController.swift
//  CatFact
//
//  Created by Sarvar Boltaboyev on 30/08/24.
// 

import UIKit

class ViewController: UIViewController {

    
    var modelArray = [CatFactModel]()
    let label = UILabel()
    let catImage = UIImageView()
    let catfactLabel = UILabel()
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        configureImage()
        configureCatFactLabel()
        configureButton()
        appendingFacts()
    }
    
    func appendingFacts() {
        let fact1 = CatFactModel()
        fact1.fact = "Cats are cute"
        let fact2 = CatFactModel()
        fact2.fact = "Cats like milk"
        let fact3 = CatFactModel()
        fact3.fact = "Cats like sleepping"
        let fact4 = CatFactModel()
        fact4.fact = "I don't much like cats"
        let fact5 = CatFactModel()
        fact5.fact = "Cats are allowed to enter mosque by contrst other animal not!"
        
        
        modelArray = [fact1, fact2, fact3, fact4, fact5]
    }
    func configureLabel() {
        view.addSubview(label)
        label.text = "Fancy facts regarding cats :)"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    func configureImage() {
        view.addSubview(catImage)
        catImage.layer.cornerRadius = 10
        catImage.image = UIImage(named: "images")
        catImage.contentMode = .scaleAspectFill
        catImage.clipsToBounds = true
        
        catImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
    
            catImage.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            catImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            catImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            catImage.heightAnchor.constraint(equalToConstant: 210)
    
            ])
    }
    func configureCatFactLabel() {
        view.addSubview(catfactLabel)
        catfactLabel.text = "Tap 'Get Fact' to get fancy facts"
        catfactLabel.numberOfLines = 5
        catfactLabel.textAlignment = .center
        catfactLabel.font = .boldSystemFont(ofSize: 27)
        
        catfactLabel.translatesAutoresizingMaskIntoConstraints = false
        
        catfactLabel.topAnchor.constraint(equalTo: catImage.bottomAnchor, constant: 20).isActive = true
        catfactLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        catfactLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        catfactLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
    func configureButton() {
        view.addSubview(button)
        button.setTitle("Get Fact", for: .normal)
        button.backgroundColor = UIColor(red: 0, green: 141/255, blue: 71/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 29)
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(generateFacts), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: catfactLabel.bottomAnchor, constant: 300).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func generateFacts() {
        
        let randomIndex = Int.random(in: 0...(modelArray.count - 1))
        
        let randomFact = modelArray[randomIndex].fact
        catfactLabel.text = randomFact
        
    }
    
}

