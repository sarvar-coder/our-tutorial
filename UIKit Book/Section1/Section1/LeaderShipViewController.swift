//
//  LeaderShipViewController.swift
//  Section1
//
//  Created by Sarvar Boltaboyev on 16/07/24.
//

import UIKit



class LeaderShipViewController: UIViewController {
    
    var arr = [String]()
    var arr1 = [Int]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}
extension LeaderShipViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        let label1 = cell.viewWithTag(1001) as! UILabel
        
      
        label.text = arr[indexPath.row]
        label1.text = String(arr1[indexPath.row])
        
        return cell
    }
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
