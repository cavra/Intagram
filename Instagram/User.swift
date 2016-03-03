//
//  User.swift
//  Instagram
//
//  Created by Cory Avra on 3/2/16.
//  Copyright © 2016 coryavra. All rights reserved.
//

import UIKit
import Parse

class User: NSObject {

    // Variables
    var profilePic: UIImage?
    
    var name: String?
    var aboutMe: String?
    
    // Deserialize the PFObject
    init(userData: PFObject) {
        super.init()
        
        // Get the Image from the PFFile
        let photoString = userData["profilePicture"] as? PFFile
        photoString?.getDataInBackgroundWithBlock({ (photoString: NSData?, error: NSError?) -> Void in
            if (error == nil) {
                self.profilePic = UIImage(data:photoString!)
                
                // Post a notification for uploaded photo
                NSNotificationCenter.defaultCenter().postNotificationName("photoUploaded", object: nil)
            } else {
                print(error?.localizedDescription)
            }
        })
        
        // Set the texts
        name = userData["name"] as? String
        aboutMe = userData["aboutMe"] as? String
        
    }
    
}
