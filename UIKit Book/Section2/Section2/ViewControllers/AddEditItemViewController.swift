//
//  AddItemViewController.swift
//  Section2
//
//  Created by Sarvar Boltaboyev on 24/07/24.
//
import UserNotifications
import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func addEditItemViewControllerDidCancel(_ controller: AddEditItemViewController)
    func addEditItemViewController(_ controller: AddEditItemViewController, didFinishAdding item: ChecklistItem)
    func addEditItemViewController(_ controller: AddEditItemViewController, didFinishEditing item: ChecklistItem)
}

class AddEditItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var shouldRemindSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        textField.becomeFirstResponder()
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
//            doneBarButton.isEnabled = true
            shouldRemindSwitch.isOn = item.shouldRemind  // chapter 20
            datePicker.date = item.dueDate               // chapter 20
        }
    }
    

    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit {
            item.text = textField.text!
            
            item.shouldRemind = shouldRemindSwitch.isOn  // add this
            item.dueDate = datePicker.date               // add this
            item.scheduleNotification()
            delegate?.addEditItemViewController(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            
            item.shouldRemind = shouldRemindSwitch.isOn  // chapter 20
            item.dueDate = datePicker.date
            item.scheduleNotification()                  // chapter 20
            delegate?.addEditItemViewController(self, didFinishAdding: item)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addEditItemViewControllerDidCancel(self)
    }
    
    @IBAction func shouldRemindToggled(_ switchControl: UISwitch) {
      textField.resignFirstResponder()
      if switchControl.isOn {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) {_, _
    in
    } }
    }
    
    // MARK: - Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {  // for disabling selection when user taps on the row
        return nil
    }
    
    // MARK: - Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}

