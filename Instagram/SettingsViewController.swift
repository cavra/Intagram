//
//  SettingsViewController.swift
//  Instagram
//
//  Created by Cory Avra on 2/29/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        PFUser.logOut()

        NSNotificationCenter.defaultCenter().postNotificationName("userLoggedOut", object: nil)
    }
}
