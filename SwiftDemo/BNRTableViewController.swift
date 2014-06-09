//
//  BNRTableViewController.swift
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/8/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

import UIKit
import Foundation

class BNRTableViewController: UITableViewController, BNRPersonStoreDelegate {
    
    var persons: Array<BNRPerson> = []
    var personStore: BNRPersonStore = BNRPersonStore()

    init(personStore: BNRPersonStore) {
        self.personStore = personStore
        super.init(nibName: nibName, bundle: nibBundle)
        self.personStore.delegate = self
        persons = self.personStore.allPersons as Array
        navigationItem.title = "Persons"
        navigationItem.leftBarButtonItem = editButtonItem()
        let rbbi = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addNewPerson")
        navigationItem.rightBarButtonItem = rbbi
    }
    
    deinit {
        let notificationName = BNRPersonViewController.BNRPersonViewControllerDidUpdatePersonNotification()
        let defaultCenter = NSNotificationCenter.defaultCenter()
        defaultCenter.removeObserver(self, name: notificationName, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "BNRTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "BNRTableViewCell")
        tableView.rowHeight = 44;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // #pragma mark - Table view data source

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("BNRTableViewCell", forIndexPath: indexPath) as BNRTableViewCell

        let person = persons[indexPath!.row]
        cell.nameLabel.text = person.name
        cell.ageLabel.text = "\(person.age)"
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let person = persons[indexPath.row]
            personStore.removePerson(person)
            persons = personStore.allPersons as Array
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    // #pragma mark - Table view delegate
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        let person = persons[indexPath.row]
        let vc = BNRPersonViewController(person: person, personStore: personStore, newPerson: false)
        var defaultCenter = NSNotificationCenter.defaultCenter()
        
        defaultCenter.addObserver(self,
        selector: "respondToUpdateNotification",
        name: BNRPersonViewController.BNRPersonViewControllerDidUpdatePersonNotification(),
        object: vc)
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    // #pragma mark - Respond to person update notification
    
    func respondToUpdateNotification () {
        tableView.reloadData()
    }
    
    // #pragma mark - Add new item
    
    func addNewPerson () {
        var person = BNRPerson(name: "", age: 0)
        var newPersonVC = BNRPersonViewController(person: person, personStore: personStore, newPerson: true)
        navigationController.pushViewController(newPersonVC, animated: true)
    }
    
    // #pragma mark - Person store delegate
    
    func didAddPersonToPersonStore(personStore: BNRPersonStore!) {
        self.personStore = personStore as BNRPersonStore
        persons = self.personStore.allPersons as Array
        tableView.reloadData()
    }

}
