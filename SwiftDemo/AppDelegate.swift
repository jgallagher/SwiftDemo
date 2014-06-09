//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by Matthew D. Mathias on 6/8/14.
//  Copyright (c) 2014 BigNerdRanch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window!.backgroundColor = UIColor.whiteColor()
        
        let matt = BNRPerson(name: "Matt", age: 32);
        let tj = BNRPerson(name: "TJ", age: 31);
        let rod = BNRPerson(name: "Rod", age: 99);
        let nate = BNRPerson(name: "Nate", age: 13);
        let john = BNRPerson(name: "John", age: 30);
        
        let personArray = [matt,tj,rod,nate,john];
        let personStore = BNRPersonStore(persons: personArray)
        
        let tableVC = BNRTableViewController(personStore: personStore)
        let navController = UINavigationController(rootViewController: tableVC)
        self.window!.rootViewController = navController
        self.window!.makeKeyAndVisible()
        return true
    }

}

