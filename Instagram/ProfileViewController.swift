//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Cory Avra on 2/29/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    // Outlets
    @IBOutlet var profileView: Profile!
    
    // Variables
    var users: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDataFromParse()
        
        // Pass the data to the ProfileDetails view
        self.profileView.user = users
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchDataFromParse() {
        
        // Construct PFQuery
        let query = PFQuery(className: "UserProfile")
  
        // Fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (users: [PFObject]?, error: NSError?) -> Void in
            if (users != nil) {
                //self.users = users
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
}
