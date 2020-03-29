//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Michael Guay on 3/28/20.
//  Copyright © 2020 Michael Guay. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, UITextFieldDelegate {
    
    @IBOutlet var descriptionLabel: UITextField!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var idLabel: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = item.name
        descriptionLabel.text = item.descriptionText
        idLabel.text = numberFormatter.string(from: NSNumber(value: item.id))
        dateLabel.text = dateFormatter.string(from: item.dateCreated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
        item.name = nameField.text ?? ""
        item.descriptionText = descriptionLabel.text ?? ""
        
        if let idText = idLabel.text, let value = numberFormatter.number(from: idText) {
            item.id = value.intValue
        } else {
            item.id = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
