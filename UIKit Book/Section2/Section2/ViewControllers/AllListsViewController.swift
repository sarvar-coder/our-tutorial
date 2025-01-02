//
//  AllListsViewController.swift
//  Section2
//
//  Created by Sarvar Boltaboyev on 29/07/24.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    var dataModel: DataModel!
    
    let cellIdentifier = "ChecklistCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
   
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get cell
        let cell: UITableViewCell!
        
        if let tmp = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
          cell = tmp
        } else {
          cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        let list = dataModel.lists[indexPath.row]
        cell.textLabel!.text = list.name
        cell.accessoryType = .detailDisclosureButton
    
        cell.imageView?.image = UIImage(named: list.iconName)
        let count = list.countUncheckedItems()
        
        if list.items.count == 0 {
            cell.detailTextLabel!.text = "(No Items)"
        } else {
            cell.detailTextLabel!.text = count == 0 ? "All Done!" : "\(count) Remaining"
        }
        return cell
    }
    // MARK: - Table VIew Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = dataModel.lists[indexPath.row]
        // adding this line chapter 18
        dataModel.indexOfSelectedChecklist = indexPath.row
        
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
        
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataModel.lists.remove(at: indexPath.row)
        
       
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    // this function is responsible for editing checklist when row tapped thst selected row ready to editing
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let controller = storyboard!.instantiateViewController(identifier: "ListDetailViewController") as! ListDetailViewController
        controller.delegate = self
        
        let chechklist = dataModel.lists[indexPath.row]
        controller.checklistToEdit = chechklist
        navigationController?.pushViewController(controller, animated: true)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as? Checklist
        } else if segue.identifier == "AddChecklist" {
            let controller = segue.destination as! ListDetailViewController
            controller.delegate = self
        }
    }
}

extension AllListsViewController: ListDetailViewControllerDelegate {
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist) {
        dataModel.lists.append(checklist)
        dataModel.sortChecklists()
        tableView.reloadData() 
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist) {
        dataModel.sortChecklists()
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
// chapter 18
extension AllListsViewController: UINavigationControllerDelegate {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        navigationController?.delegate = self
        let index = dataModel.indexOfSelectedChecklist
        
        if index >= 0 && index < dataModel.lists.count {
            let checklist = dataModel.lists[index]
            performSegue(withIdentifier: "ShowChecklist", sender: checklist)
        }
    }
    // MARK: - Navigation Controller Delegates
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        // Was the back button tapped?
        if viewController === self {
            dataModel.indexOfSelectedChecklist = -1
        }
    }
}
