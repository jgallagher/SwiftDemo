//
//  BNRPersonViewController.swift
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/8/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

import UIKit

class BNRPersonViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameTextField: UITextField
    @IBOutlet var ageTextField: UITextField
    @IBOutlet var topConstraint: NSLayoutConstraint
    let rbbi: UIBarButtonItem = UIBarButtonItem()
    let person: BNRPerson
    let personStore: BNRPersonStore
    var newPerson: Bool
    
    init(person: BNRPerson, personStore: BNRPersonStore, newPerson: Bool) {
        self.person = person
        self.personStore = personStore
        self.newPerson = newPerson
        super.init(nibName: nibName, bundle: nibBundle)
        rbbi = UIBarButtonItem(title: "Save",
            style: UIBarButtonItemStyle.Bordered,
            target: self,
            action: "saveNewPerson")
        rbbi.enabled = false
        navigationItem.rightBarButtonItem = rbbi
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.text = person.name
        ageTextField.text = "\(person.age)"
    }
    
    class func BNRPersonViewControllerDidUpdatePersonNotification () -> String {
        return "BNRPersonViewControllerDidUpdatePersonNotification"
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldShouldBeginEditing(textField: UITextField!) -> Bool {
        rbbi.enabled = true
        return true
    }
    
    func saveNewPerson () {
        person.name = nameTextField.text
        if let newAge = ageTextField.text.toInt() {
            person.age = newAge
        } else {
            person.age = 0
        }
        if (newPerson) {
            personStore.addPerson(person)
        } else {
            let notificationName = BNRPersonViewController.BNRPersonViewControllerDidUpdatePersonNotification()
            let notification = NSNotification(name: notificationName, object: self)
            NSNotificationCenter.defaultCenter().postNotification(notification)
        }
        navigationController.popViewControllerAnimated(true)
    }

}
