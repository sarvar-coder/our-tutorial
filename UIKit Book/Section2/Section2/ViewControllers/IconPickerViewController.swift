//
//  IconPickerViewController.swift
//  Section2
//
//  Created by Sarvar Boltaboyev on 03/08/24.
//
 
import UIKit

protocol IconPickerViewControllerDelegate: AnyObject {
    func iconPicker(_ viewController: IconPickerViewController, didPick name: String)
}

class IconPickerViewController: UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    
    let icons = ["No Icon", "Appointments", "Birthdays", "Chores","Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - Table view Delegates
    override func tableView( _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IconCell", for: indexPath)
        let iconName = icons[indexPath.row]
        cell.textLabel!.text = iconName
        cell.imageView!.image = UIImage(named: iconName)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            let iconName = icons[indexPath.row]
           delegate.iconPicker(self, didPick: iconName)
        }
    } 
}
