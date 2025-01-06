//
//  ViewController.swift
//  SandBox
//
//  Created by Sarvar Boltaboyev on 11/11/24.
//

import UIKit

class ViewController: UIViewController {
    let textFiled = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(textFiled.text ?? "NOTHING")
        setup()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        print(textFiled.text ?? "Appearing")
    }
    
    func setup() {
        view.addSubview(textFiled)
        
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        textFiled.delegate = self
        textFiled.placeholder = "Type in"
        textFiled.becomeFirstResponder()
        textFiled.borderStyle = .roundedRect
        textFiled.tintColor = .black
        
        // extra interaction
        textFiled.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        NSLayoutConstraint.activate([
            textFiled.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textFiled.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: textFiled.trailingAnchor, multiplier: 2)
        ])
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {

    // return NO to disallow editing.
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }

    // became first responder
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    // return YES to allow editing to stop and to resign first responder status.
    // return NO to disallow the editing session to end
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }

    // if implemented, called in place of textFieldDidEndEditing: ?
    func textFieldDidEndEditing(_ textField: UITextField) {
    }

    // detect - keypress
    // return NO to not change text
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let word = textField.text ?? ""
        let char = string
        print("Default - shouldChangeCharactersIn: \(word) \(char)")
        return true
    }

    // called when 'clear' button pressed. return NO to ignore (no notifications)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }

    // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true) // resign first responder
        return true
    }
}

// MARK: - Extra Actions
extension ViewController {
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        print("Extra - textFieldEditingChanged: \(sender.text)")
    }
}
