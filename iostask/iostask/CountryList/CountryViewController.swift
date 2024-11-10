//
//  CountryViewController.swift
//  iostask
//
//  Created by Sarvar Boltaboyev on 08/11/24.
//

import UIKit

class CountryViewController: UIViewController {
    
    let tableView = UITableView()
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetch()
    }
}
extension CountryViewController {
    private func setup() {
        setupTableView()
        style()
        layout()
       
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CountryCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 200
    }
    
    func style() {
    
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension CountryViewController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountryCell
        cell.configure(with: countries[indexPath.row])
        return cell
    }
}

extension CountryViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(CountryDetailViewController(country: countries[indexPath.row]), animated: true)
    }
}
// networking
extension CountryViewController {
    func fetch() {
        CountryService.shared.fetchCountries { result in
            switch result {
            case .success(let success):
                self.countries = success.countries
                self.tableView.reloadData()
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
}
